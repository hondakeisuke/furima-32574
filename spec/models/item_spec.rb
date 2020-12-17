require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品投稿機能' do
    context '商品投稿がうまくいくとき' do
      it 'imageとitems_name,explanation,category_id,condition_id,delivery_free_id,prefecture_id,delivery_day_id,priceが存在すれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿がうまくいかないとき' do
      it 'imageが空のとき登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'items_nameが空のとき登録できない' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end

      it 'explanationが空のとき登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空のとき登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it 'condition_idが空のとき登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
      end
      it 'delivery_free_idが空のとき登録できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", 'Delivery day is not a number')
      end
      it 'prefecture_idが空のとき登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it 'delivery_day_ideが空のとき登録できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", 'Delivery day is not a number')
      end
      it 'priceが空のとき登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満のとき登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが9,999,999円より大きいとき登録できない' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
