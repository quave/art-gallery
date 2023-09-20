const express = require('express');
const router = express.Router();
const db = require('../db/models');

const params = {title: 'Alyona Raevsky'}


router.get('/info', function(req, res, next) {
  res.render('info', {...params, action: 'info'});
});

router.get('/c?/:catId?', async function(req, res, next) {
  const worksQuery = req.params.catId ?
    {where: {categoryId: req.params.catId}} :
    {}
  const works = await db.Work.findAll(worksQuery);
  const categories = await db.Category.findAll();
  res.render('index', { ...params, action: 'landing', categories, works });
});

module.exports = router;
