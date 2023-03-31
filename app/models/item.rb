class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attachment :image

  def self.search(search)
      return Item.all unless search
      Item.where(['name LIKE ?', "%#{search}%"])
  end
  
  
end
