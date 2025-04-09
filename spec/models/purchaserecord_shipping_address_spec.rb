require 'rails_helper'

RSpec.describe PurchaserecordShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchaserecord_shipping_address = FactoryBot.build(:purchaserecord_shipping_address, user_id:@user.id, item_id: @item.id)
    sleep(1)
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
end  