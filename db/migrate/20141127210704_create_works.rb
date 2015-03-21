class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name, null: false
      t.text :description
      t.string :size, null: false, default: ''
      t.references :category, null: false
      t.integer :price
      t.boolean :enabled, null: false, default: true

      t.timestamps
    end
  end
end
