class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :end_user_id
      t.integer :billing_amount
      t.string :name
      t.string :adress
      t.integer :order_status, default:"0"
      t.integer :payment
      t.string :postal_code
      t.integer :shipping_fee, default: 800


      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  end
end
