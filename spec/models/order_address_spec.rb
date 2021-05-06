require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品の購入' do
    before do
      @order = FactoryBot.build(:order_address)
    end
    it 'ログイン状態の出品者以外のユーザーのみ商品の購入ができる' do

    end
    it '全ての項目が正しく入力されていれば購入できる' do
      
    end
    it '郵便番号がないと、購入できない' do
    
    end
    it '郵便番号にはハイフンがないと、購入できない' do
      
    end
    it '都道府県がないと、購入できない' do
      
    end
    it '市区町村がないと、購入できない' do
      
    end
    it '番地がないと、購入できない' do
      
    end
    it '電話番号がないと、購入できない' do
      
    end
    it '電話番号は11桁以内の数値以外は購入できない' do
      
    end
  end
end
