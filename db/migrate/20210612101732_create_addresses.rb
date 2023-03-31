class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :end_user_id
      t.string :name
      t.string :addresses
      t.string :postal_code

      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false
    end
  end
end
