const query = require('./conn');

async function getWorks() {
  return [{
    id: 1,
    categoryId: 1,
    order: 1,
    name: 'Sunny Sevastopol',
    description: 'Oil on canvas',
    size: '20x30',
    price: 300,
    image: 'https://www.artmajeur.com/medias/standard/a/n/andriy-chebotaru/artwork/9753289_phpikovgw.jpg'
  }];
}

module.exports = {
  getWorks
};