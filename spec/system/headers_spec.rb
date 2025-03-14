require 'rails_helper'

RSpec.describe 'ヘッダーの表示', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログアウト状態' do
    it 'トップページのヘッダーに「新規登録」「ログイン」ボタンが表示されている' do
      visit root_path
      expect(page).to have_link('新規登録', href: new_user_registration_path)
      expect(page).to have_link('ログイン', href: new_user_session_path)
    end

    it '「新規登録」ボタンをクリックすると、新規登録ページへ遷移する' do
      visit root_path
      click_on '新規登録'
      expect(current_path).to eq new_user_registration_path
    end

    it '「ログイン」ボタンをクリックすると、ログインページへ遷移する' do
      visit root_path
      click_on 'ログイン'
      expect(current_path).to eq new_user_session_path
    end
  end

  context 'ログイン状態' do
    it 'トップページのヘッダーに「ユーザーのニックネーム」「ログアウト」ボタンが表示されている' do
      sign_in @user
      visit root_path
      expect(page).to have_content(@user.nickname)
      expect(page).to have_link('ログアウト', href: destroy_user_session_path)
    end

    it '「ログアウト」ボタンをクリックすると、ログアウトできる' do
      sign_in @user
      visit root_path
      click_on 'ログアウト'
      expect(page).to have_link('新規登録')
      expect(page).to have_link('ログイン')
    end
  end
end
