require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品の購入' do
    before do
      @order = FactoryBot.build(:order_address)
      @item = FactoryBot.build(:item)
    end
    context '商品の購入ができる時' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it '郵便番号がないと、購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にはハイフンがないと、購入できない' do
        @order.postal_code = 1234567
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code Input correctly")
      end
      it '都道府県がないと、購入できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end
      it 'prefecture_idが[1]では、購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end
      it '市区町村がないと、購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地がないと、購入できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号がないと、購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁以内の数値以外は購入できない' do
        @order.phone_number = 123456789012
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号は全角数字では購入できない' do
        @order.phone_number = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号は半角英数字混合では購入できない' do
        @order.phone_number = 'test1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input only number")
      end
      it '電話番号は半角英語では購入できない' do
        @order.phone_number = 'testtesttes'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Input only number")
      end
      it 'user_idがないと購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
