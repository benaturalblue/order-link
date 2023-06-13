require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'company_name,email,password,password_confirmation,last_name,first_name,kana_last_name,kana_first_name,phone_numberが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'company_nameが空では登録できない' do
        @user.company_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("事業者名を入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("代表者（性）を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("代表者（名）を入力してください")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("代表者（カナ）を入力してください")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("代表者（カナ）を入力してください")
      end
      it 'phone_numberが空では登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '123456ａ'
        @user.password_confirmation = '123456ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）で入力されないと登録できない' do
        @user.last_name = 'Tom'
        @user.valid?
        expect(@user.errors.full_messages).to include('代表者（性）は不正な値です')
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）で入力されないと登録できない' do
        @user.first_name = 'Tom'
        @user.valid?
        expect(@user.errors.full_messages).to include('代表者（名）は不正な値です')
      end
      it 'kana_last_nameが全角（カタカナ）で入力されないと登録できない' do
        @user.kana_last_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('代表者（カナ）は不正な値です')
      end
      it 'kana_first_nameが全角（カタカナ）で入力されないと登録できない' do
        @user.kana_first_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('代表者（カナ）は不正な値です')
      end
      it 'phone_numberは10桁未満だと登録できない' do
        @user.phone_number = 123456789
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は10文字以上で入力してください')
      end
      it 'phone_numberは12桁以上だと登録できない' do
        @user.phone_number = 112234567890
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end
    end
  end
end
