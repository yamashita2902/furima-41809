require 'rails_helper'

RSpec.describe PurchaserecordShippingAddress, type: :model do
  # before do
  #   @user = FactoryBot.create(:user)
  #   @item = FactoryBot.create(:item)
  #   @user2 = FactoryBot.create(:user)
  #   @purchaserecord_shipping_address = FactoryBot.build(:purchaserecord_shipping_address, user_id:@user.id, item_id: @item.id)
  #   sleep(1)
  # end
  # RSpec.configure do |config|
  #   config.include Devise::Test::ControllerHelpers, type: :controller
  # end

  # describe '商品購入ページへのアクセス' do
  #     context 'アクセス制限' do
  #     it 'ログイン中かつ他人の出品商品購入ページに遷移できる' do
  #       sign_in @user2
  #       visit new_item_order_path(@item)
  #       expect(current_path).to eq new_item_order_path(@item)
  #     end

  #     it 'ログイン中かつ売却済み商品の購入ページにアクセスするとトップページへ' do
  #       sign_in @user2
  #       sold_item = create(:item, buyer: @user2)
  #       visit new_item_order_path(sold_item)
  #       expect(current_path).to eq root_path
  #     end

  #     it 'ログイン中かつ自身の出品商品の購入ページにアクセスするとトップページへ' do
  #       sign_in @item.seller
  #       visit new_item_order_path(@item)
  #       expect(current_path).to eq root_path
  #     end

  #     it 'ログアウト状態では購入ページにアクセスできずログインページへ' do
  #       visit new_item_order_path(@item)
  #       expect(current_path).to eq new_user_session_path
  #     end
  #   end
  # end
end
