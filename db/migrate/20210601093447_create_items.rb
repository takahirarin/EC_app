class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id
      t.integer :price
      t.string :name
      t.text :description
      t.string :image_id
      t.boolean :is_sales, default: true

      t.timestamps default: -> { "CURRENT_TIMESTAMP" }, null: false


    end
  end
end
