class CategoriesAddNameLat < ActiveRecord::Migration
  def change
    add_column :categories, :name_lat, :string
  end
end
