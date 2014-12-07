class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name, null: false
      t.text :description
      t.references :category, null: false
      t.string :image_name, null: false
      t.integer :price

      t.timestamps
    end
  end
end
