class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer :order_id
      t.integer :item_id
      t.integer :amount
      t.integer :production_status, default:"0"
      t.integer :price
      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  end
end
