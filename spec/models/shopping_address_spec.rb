require 'rails_helper'

RSpec.describe Credit, type: :model do
  # describe '購入情報の保存' do
  #   before do
  #     @credit = FactoryBot.build(:shopping_address)
  #   end

  #   it '全ての値が正しく入力されていれば保存できること' do
  #     expect(@credit).to be_valid
  #   end
  #   it '建物名は空でも保存できること' do
  #     @credit.building_name = nil
  #     expect(@credit).to be_valid
  #   end
  #   it '郵便番号の入力がないと保存できないこと' do
  #     @credit.post_code = nil
  #     @credit.valid?
  #     expect(@credit.errors.full_messages).to include("Post code can't be blank")
  #   end
  #   it '郵便番号にハイフンがないと保存できないこと' do
  #     @credit.post_code = '1234567'
  #     @credit.valid?
  #     expect(@credit.errors.full_messages).to include()
  #   end
  #   it '都道府県の入力がないと保存できないこと' do
  #     @credit.prefecture_id = 0
  #     @credit.valid?
  #     expect(@credit.errors.full_messages).to include()
  #   end
  #   it '市区町村の入力がないと保存できないこと' do
  #     @credit.city =  ''
  #     @credit.valid?
  #     expect(@credit.errors.full_messages).to include()
  #   end
  #   it '番地の入力がないと保存できないこと' do
  #     @credit.house_number = ''
  #     @credit.valid?
  #     expect(@credit.errors.full_messages).to include()
  #   end
  #   it '電話番号の入力がないと保存できないこと' do
  #     @credit.tell_number = ''
  #     @credit.valid?
  #     expect(@credit.errors.full_messages).to include()
  #   end
  #   it '電話番号が12文字以上だと保存できないこと' do
  #     @credit.tell_number = '123456789012'
  #     @credit.valid?
  #     expect(@credit.errors.full_messages).to include()
  #   end
  # end
end
