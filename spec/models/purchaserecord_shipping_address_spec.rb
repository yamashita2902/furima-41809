require 'rails_helper'

RSpec.describe PurchaserecordShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchaserecord_shipping_address = FactoryBot.build(:purchaserecord_shipping_address, user_id: user.id, item_id: item.id)
  end
  describe '商品購入ページへのアクセス' do
    context '商品購入ページの表示' do
      it '商品名・商品画像・価格・配送料の負担が正しく表示される' do
        visit item_path(@item)
        expect(page).to have_selector("item-image")
        expect(page).to have_content(@item.name)
        expect(page).to have_content("¥#{@item.price}")
        expect(page).to have_content(@item.delivery_style_id.name)
      end
    end
    context 'アクセス制限' do  
      it 'ログイン中かつ他人の出品商品購入ページに遷移できる' do
        sign_in @user2
        visit new_item_order_path(@item)
        expect(current_path).to eq new_item_order_path(@item)
      end
    
      it 'ログイン中かつ売却済み商品の購入ページにアクセスするとトップページへ' do
        sign_in @user2
        sold_item = create(:item, buyer: @user2)
        visit new_item_order_path(sold_item)
        expect(current_path).to eq root_path
      end
    
      it 'ログイン中かつ自身の出品商品の購入ページにアクセスするとトップページへ' do
        sign_in @item.seller
        visit new_item_order_path(@item)
        expect(current_path).to eq root_path
      end
    
      it 'ログアウト状態では購入ページにアクセスできずログインページへ' do
        visit new_item_order_path(@item)
        expect(current_path).to eq new_user_session_path
      end
    end
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
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("カード情報を入力してください")
      end
    
      it '郵便番号が空では保存できない' do
        @purchaserecord_shipping_address.postal_code = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("郵便番号を入力してください")
      end
    
      it '郵便番号が「3桁-4桁」でないと保存できない' do
        @purchaserecord_shipping_address.postal_code = '1234567'
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include('郵便番号は「123-4567」の形式で入力してください')
      end
    
      it '都道府県を選択していないと保存できない（id:1は--）' do
        @purchaserecord_shipping_address.prefecture_id = 1
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("都道府県を選択してください")
      end
    
      it '市区町村が空では保存できない' do
        @purchaserecord_shipping_address.city = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("市区町村を入力してください")
      end
    
      it '番地が空では保存できない' do
        @purchaserecord_shipping_address.address = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("番地を入力してください")
      end
    
      it '電話番号が空では保存できない' do
        @purchaserecord_shipping_address.phone_number = ''
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("電話番号を入力してください")
      end
    
      it '電話番号にハイフンが含まれていると保存できない' do
        @purchaserecord_shipping_address.phone_number = '090-1234-5678'
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数字で入力してください")
      end
    
      it '電話番号が9桁以下だと保存できない' do
        @purchaserecord_shipping_address.phone_number = '090123456'
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数字で入力してください")
      end
    
      it '電話番号が12桁以上だと保存できない' do
        @purchaserecord_shipping_address.phone_number = '090123456789'
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数字で入力してください")
      end
    
      it 'user_idが空では保存できない' do
        @purchaserecord_shipping_address.user_id = nil
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("ユーザーを入力してください")
      end
    
      it 'item_idが空では保存できない' do
        @purchaserecord_shipping_address.item_id = nil
        @purchaserecord_shipping_address.valid?
        expect(@purchaserecord_shipping_address.errors.full_messages).to include("商品を入力してください")
      end
    end
  end
end  