class PurchaserecordShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :purchaserecord_id
  attr_accessor :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Must be in the format XXX-XXXX (e.g., 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, :street, :token
    validates :phone_number, format: {
      with: /\A\d{10,11}\z/,
      message: 'is invalid'
    }
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
