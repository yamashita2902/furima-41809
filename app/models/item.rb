class Item < ApplicationRecord
  validates :name, :explanation, :price, :user, :category_id, :situation_id, :prefecture_id, :arrives_day_id, :delivery_style_id,:image , presence: true
  

  belongs_to :user
  has_one_attached :image
  validates :category_id, :situation_id, :prefecture_id, :arrives_day_id, :delivery_style_id, numericality: { other_than: 1, message: "can't be blank"}
  

  validates :price, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9_999_999, 
    message: "must be a half-width number and between ¥300 and ¥9,999,999" 
  }
  
end
