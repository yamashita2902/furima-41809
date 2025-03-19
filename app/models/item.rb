class Item < ApplicationRecord
  validates :name, :explanation, :price, :user, :category_id, :situation_id, :prefecture_id, :arrives_day_id, :delivery_style_id,:image , presence: true
  

  belongs_to :user
  has_one_attached :image
  validates :category_id, :situation_id, :prefecture_id, :arrives_day_id, :delivery_style_id, numericality: { other_than: 1, message: "can't be blank"}
  
  before_validation :check_price_format

  validates :price, presence: true, numericality: { 
      only_integer: true,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999,
      message: "must be between ¥300 and ¥9,999,999" 
    }
  
  private
  
  def check_price_format
    unless price.to_s.match?(/\A[0-9]+\z/)
      errors.add(:price, "must be a half-width number")
    end
  end
  
end
