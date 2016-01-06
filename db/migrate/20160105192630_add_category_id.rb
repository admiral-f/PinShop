class AddCategoryId < ActiveRecord::Migration
  def change
    add_column :pins, :category_id, :integer, :references => "catigories"
  end
end
