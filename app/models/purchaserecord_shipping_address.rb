class PurchaserecordShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :purchaserecord_id
  attr_accessor :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, :street, :phone_number
    validates :token
  end

  def save
   purchaserecord = Purchaserecord.create(item_id: item_id, user_id: user_id)

   ShippingAddress.create(
    post_code: post_code, 
    prefecture_id: prefecture_id,
    city: city, 
    street: street, 
    building: building,
    phone_number: phone_number,
    purchaserecord_id: purchaserecord.id
    )
  end
end
