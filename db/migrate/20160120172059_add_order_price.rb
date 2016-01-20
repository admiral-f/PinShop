class AddOrderPrice < ActiveRecord::Migration
  def change
    add_column :orders, :order_price, :decimal
  end
end
