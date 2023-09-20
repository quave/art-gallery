'use strict';
const {
  Model
} = require('sequelize');
const category = require('./category');
module.exports = (sequelize, DataTypes) => {
  class Work extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      models.Category.hasMany(models.Work)
      models.Work.belongsTo(models.Category);
    }
  }
  Work.init({
    categoryId: DataTypes.INTEGER,
    name: DataTypes.STRING,
    description: DataTypes.STRING,
    size: DataTypes.STRING,
    order: DataTypes.INTEGER,
    price: DataTypes.INTEGER,
    image: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Work',
    timestamps: false
  });
  return Work;
};