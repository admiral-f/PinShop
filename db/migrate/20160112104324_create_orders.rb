class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order
      t.string :email
      t.string :adress, default: 'office'
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.string :payment
      t.boolean :complete, default: false

      t.timestamps null: false
    end
  end
end
