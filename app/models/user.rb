class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchaserecords
  has_many :items
  validates :name, presence: true
  validates :name_zennkaku_myouzi, presence: true,
                                   format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :name_zennkaku_namae, presence: true,
                                  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validates :name_kana_myouzi, presence: true,
                               format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  validates :name_kana_namae, presence: true,
                              format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]+\z/, message: 'must include both letters and numbers' }
end
