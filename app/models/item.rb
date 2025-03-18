class Item < ApplicationRecord
  validates :name, :explanation, :price, :user, :category_id, :situation_id, :prefecture_id, :arrives_day_id, :deliverystyle_id, presence: true
  validates :price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/, message: "は半角数字のみ入力してください" }
  belongs_to :user
  has_one_attached :image
end
