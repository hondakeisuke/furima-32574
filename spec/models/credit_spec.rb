require 'rails_helper'

RSpec.describe Credit, type: :model do
  describe '購入情報の保存' do
    before do
      @credit = FactoryBot.build(:credit,user_id: 1,item_id: 1)
    end
    
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@credit).to be_valid
      end
      it '建物名は空でも保存できること' do
        @credit.building_name = nil
        expect(@credit).to be_valid
      end
    end

    context '内容に問題がある場合' do    
        it '郵便番号の入力がないと保存できないこと' do
        @credit.post_code = nil
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @credit.post_code = '1234567'
        @credit.valid?
        expect(@credit.errors.full_messages).to include('Post code is invalid')
      end
      it '都道府県の入力がないと保存できないこと' do
        @credit.prefecture_id = 0
        @credit.valid?
        expect(@credit.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '都道府県の入力がないと保存できないこと' do
        @credit.prefecture_id = ''
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it '市区町村の入力がないと保存できないこと' do
        @credit.city = ''
        @credit.valid?
        expect(@credit.errors.full_messages).to include("City can't be blank")
      end
      it '番地の入力がないと保存できないこと' do
        @credit.house_number = ''
        @credit.valid?
        expect(@credit.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号の入力がないと保存できないこと' do
        @credit.tell_number = ''
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Tell number can't be blank")
      end
      it '電話番号が12文字以上だと保存できないこと' do
        @credit.tell_number = '123456789012'
        @credit.valid?
        expect(@credit.errors.full_messages).to include('Tell number is invalid')
      end
      it '電話番号が英数字混合だと保存できないこと' do
        @credit.tell_number = '123456abcde'
        @credit.valid?
        expect(@credit.errors.full_messages).to include('Tell number is invalid')
      end
      it 'tokenが空では保存できないこと' do
        @credit.token = nil
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では保存できないこと' do
        @credit.user_id = nil
        @credit.valid?
        expect(@credit.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @credit.item_id = nil
        @credit.valid?
        expect(@credit.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
