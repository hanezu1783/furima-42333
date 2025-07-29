require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録できる場合' do
      it 'すべての項目が入力できれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_name_readingが空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'last_name_readingが空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'birthdateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'emailが一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含んでいないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordと確認用passwordが一致しない場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字を混合して入力してください')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字を混合して入力してください')
      end

      it 'passwordが全角英数字の場合登録できない' do
        @user.password = 'ＡＢＣ１２３'
        @user.password_confirmation = 'ＡＢＣ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字を混合して入力してください')
      end

      it 'passwordが半角英字と全角数字の混合の場合登録できない' do
        @user.password = 'abc１２３'
        @user.password_confirmation = 'abc１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字を混合して入力してください')
      end

      it 'last_nameが全角でないと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end

      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end

      it 'last_name_readingが全角カタカナでないと登録できない' do
        @user.last_name_reading = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid. Input full-width katakana characters.')
      end
      it 'first_name_readingが全角カタカナでないと登録できない' do
        @user.first_name_reading = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid. Input full-width katakana characters.')
      end
    end
  end
end
