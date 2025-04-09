require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchaserecord_shipping_address = FactoryBot.build(:purchaserecord_shipping_address, user_id:@user.id, item_id: @item.id)
    sleep(1)
  end
 
  describe '商品購入' do
    context '購入ができる場合' do
      it '必要な情報を全て入力すれば購入できる' do
        expect(@purchaserecord_shipping_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @purchaserecord_shipping_address .building = ''
        expect(@purchaserecord_shipping_address ).to be_valid
      end
    end 
    context '購入ができない場合' do
      it 'クレジットカード情報（token）が空では保存できない' do
        @purchaserecord_shipping_address.token = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    
      it '郵便番号が空では保存できない' do
        @purchaserecord_shipping_address.post_code = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Post code can't be blank")
      end
    
      it '郵便番号が「3桁-4桁」でないと保存できない' do
        @purchaserecord_shipping_address.post_code = '1234567'
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Post code Must be in the format XXX-XXXX (e.g., 123-4567)")
      end
    
      it '都道府県を選択していないと保存できない（id:1は--）' do
        @purchaserecord_shipping_address.prefecture_id = 1
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
    
      it '市区町村が空では保存できない' do
        @purchaserecord_shipping_address.city = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("City can't be blank")
      end
    
      it '番地が空では保存できない' do
        @purchaserecord_shipping_address.street = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Street can't be blank")
      end
    
      it '電話番号が空では保存できない' do
        @purchaserecord_shipping_address.phone_number = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
    
      it '電話番号にハイフンが含まれていると保存できない' do
        @purchaserecord_shipping_address.phone_number = '090-1234-5678'
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    
      it '電話番号が9桁以下だと保存できない' do
        @purchaserecord_shipping_address.phone_number = '090123456'
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    
      it '電話番号が12桁以上だと保存できない' do
        @purchaserecord_shipping_address.phone_number = '090123456789'
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    
      it 'user_idが空では保存できない' do
        @purchaserecord_shipping_address.user_id = nil
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("User can't be blank")
      end
    
      it 'item_idが空では保存できない' do
        @purchaserecord_shipping_address.item_id = nil
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end