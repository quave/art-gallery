const express = require('express');
const router = express.Router();
const sha512 = require('crypto-js/sha512');
const db = require('../db/models');
const multer  = require('multer');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/images/works/')
  },
  filename: function (req, file, cb) {
    cb(null,  Date.now() + '-' + file.originalname);
  }
})
const upload = multer({ storage });

const salt = "I6#^YETDPM*IJALjo2@LJElw4nMOkrd1G6CJoFl#WnQskBwLoTQ31lTanOyI!*r#";
const secret = process.env.SECRET;
const secretHash = sha512(salt + secret).toString();
const error401 = "Try again";
const params = {title: 'Alyona Raevsky', salt}


function checkAuth(req, res, next) {
  const token = req.cookies['JWT_TOKEN'];
  if (token !== secretHash) {
    res.status = 401;
    res.redirect('/adminka/auth?401');
  } else {
    next();
  }
}

router.get('/auth', function(req, res, next) {
  const p = req.query['401'] != undefined ? {...params, error401} : params;
  console.log(req.query);
  res.render('auth', p);
});

router.post('/auth', function(req, res, next) {
  if(req.body.secret !== secretHash) {
    res.status = 401;
    res.render('auth', {...params, error401});
  } else {
    res.cookie('JWT_TOKEN', `${req.body.secret}`,
      { maxAge: 900000, httpOnly: true, secure: true });
    res.redirect('/adminka');
  }
});

router.get('/', checkAuth, async function(req, res, next) {
  console.log('rendering adminka');
  res.header('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
  const works = await db.Work.findAll();
  const categories = await db.Category.findAll({order: [['order', 'ASC']]});
  res.render('adminka', {...params, categories, works});
});

function isValidWork(w) {
  console.log('body', w);
  return w.categoryId && w.name && w.size && w.price;
}

router.post('/work',
  [checkAuth, upload.single('image')],
  async function(req, res, next) 
{
  if (isValidWork(req.body)) {
    db.Work.create({
      categoryId: req.body.categoryId,
      name: req.body.name,
      desciption: req.body.desciption,
      size: req.body.size,
      price: req.body.price,
      image: req.file.filename,
      order: req.body.order || 0
    });
  }

  res.redirect('/adminka');
});

router.post('/work/d', checkAuth, async function(req, res, next) {
  req.body.id && db.Work.destroy({where: {id: req.body.id}});
  res.redirect('/adminka');
});

router.post('/category', checkAuth, async function(req, res, next) {
  console.log("category post", req.body);

  if (req.body.name && req.body.order) {
    db.Category.create({name: req.body.name, order: req.body.order});
  }

  res.redirect('/adminka');
});
router.post('/category/d', checkAuth, async function(req, res, next) {
  req.body.id && db.Category.destroy({where: {id: req.body.id}});
  res.redirect('/adminka');
});

module.exports = router;
