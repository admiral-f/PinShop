class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :label
      t.decimal :price
      t.text :description
      t.string :material
      t.boolean :is_best_offer


      t.timestamps null: false
    end
  end
end
