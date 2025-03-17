class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  

  belongs_to :category
  belongs_to :situation
  belongs_to :prefecture
  belongs_to :arrives_day
  belongs_to :deliverystyle

  validates :name, :explanation, :price, :user, presence: true
  validates :category_id, :situation_id, :prefecture_id, :arrives_day_id, :deliverystyle_id, numericality: { other_than: 1, message: "can't be blank"}
end
