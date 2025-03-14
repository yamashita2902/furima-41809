require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'ネームが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したメールアドレスでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'メールアドレスに@が含まれていない場合、登録できない' do
        @user.email = 'testemail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'a1b2c'
        @user.password_confirmation = 'a1b2c'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードが半角英数字混合でない場合（英字のみ）登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end

      it 'パスワードが半角英数字混合でない場合（数字のみ）登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end

      it 'パスワードとパスワード確認が一致しないと登録できない' do
        @user.password_confirmation = 'different'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '名字全角が空では登録できない' do
        @user.name_zennkaku_myouzi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name zennkaku myouzi can't be blank")
      end

      it '名前全角が空では登録できない' do
        @user.name_zennkaku_namae  = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name zennkaku namae can't be blank")
      end

      it '名字全角が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.name_zennkaku_myouzi = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name zennkaku myouzi is invalid. Input full-width characters.")
      end

      it '名前全角が全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.name_zennkaku_namae = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name zennkaku namae is invalid. Input full-width characters.")
      end

      it '名字カナが空では登録できない' do
        @user.name_kana_myouzi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana myouzi can't be blank")
      end

      it '名前カナが空では登録できない' do
        @user.name_kana_namae  = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana namae can't be blank")
      end

      it '名字カナが全角カタカナ以外では登録できない' do
        @user.name_kana_myouzi  = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana myouzi is invalid. Input full-width katakana characters.")
      end

      it '名前カナが全角カタカナ以外では登録できない' do
        @user.name_kana_namae = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana namae is invalid. Input full-width katakana characters.")
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
