class Item < ApplicationRecord
  validates :name, :explanation, :price, :category_id, :situation_id, :prefecture_id, :arrives_day_id, :delivery_style_id,
            :image, presence: true

  belongs_to :user
  has_many :purchaserecords
  has_one_attached :image
  validates :category_id, :situation_id, :prefecture_id, :arrives_day_id, :delivery_style_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'must be a half-width number and between ¥300 and ¥9,999,999'
  }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :arrives_day
  belongs_to_active_hash :delivery_style

  def owned_by?(user)
    user.present? && user.id == user_id
  end

  def sold_out?
    purchaserecords.exists?
  end
end
