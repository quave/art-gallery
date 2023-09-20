'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    /**
     * Add seed commands here.
     */
    await queryInterface.bulkInsert('Categories', [
      {name: "Portrait", order: 1},
      {name: "Still life", order: 5},
      {name: "Landscape", order: 7},
      {name: "Graphics", order: 10},
      {name: "Etude", order: 3},
      {name: "Illustrations", order: 4}
    ], {});
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add commands to revert seed here.
     */
    await queryInterface.bulkDelete('Categories', null, {});
  }
};
