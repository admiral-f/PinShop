class AddProductImage < ActiveRecord::Migration
  def change
    add_attachment :pins, :image
  end
end
