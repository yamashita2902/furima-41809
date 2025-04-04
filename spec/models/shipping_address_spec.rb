require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    @item = FactoryBot.build(:item)

  end
  describe '商品購入' do
    context '購入ができる場合' do
      it '必要な情報を全て入力すれば購入できる' do
      
      end
    end
    it '商品名・商品画像・価格・配送料の負担が正しく表示される' do
      visit item_path(@item)
      expect(page).to have_selector("item-image")
      expect(page).to have_content(@item.name)
      expect(page).to have_content("¥#{@item.price}")
      expect(page).to have_content(@item.delivery_style_id.name)
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

    context '購入できない場合' do
      it 'カード情報が不正だと購入できずエラーメッセージが表示される' do
        fill_in 'カード番号', with: ''
        click_button '購入'
        expect(current_path).to eq item_orders_path(@item)
        expect(page).to have_content('カード情報を入力してください')
      end
    
      it 'フォーム再表示時も入力済み項目（カード情報以外）は保持されている' do
        fill_in '郵便番号', with: '123-4567'
        fill_in 'カード番号', with: ''
        click_button '購入'
        expect(find_field('郵便番号').value).to eq '123-4567'
        expect(find_field('カード番号').value).to be_nil
      end
    
      it 'エラーメッセージが重複して表示されない' do
        fill_in '郵便番号', with: ''
        click_button '購入'
        expect(page).to have_selector('.error-message', text: '郵便番号を入力してください', count: 1)
      end
    end
    
  end
end
