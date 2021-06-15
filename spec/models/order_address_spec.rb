require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address)
    @order_address.user_id = @user.id
    @order_address.item_id = @item.id
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it 'すべてのデータが存在していれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it 'postal_codeにハイフンがあれば購入できる' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'phone_numberは10桁か11桁の数値であれば購入できる' do
        @order_address.phone_number = '09012345678'
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postal_codeが空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'prefectures_idが---では購入できない' do
        @order_address.prefectures_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'municipalityが空では購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'postal_codeにハイフンがなければ購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は（ー）を入れてください")
      end
      it 'phone_numberは10桁か11桁の数値でなければ購入できない' do
        @order_address.phone_number = '111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 は数字を入力してください")
      end
      it 'phone_numberは12桁以上の数値では購入できない' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 は数字を入力してください")
      end
      it 'phone_numberは半角英字では購入できない' do
        @order_address.phone_number = 'aaaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 は数字を入力してください")
      end
      it 'phone_numberは半角英数字混合では購入できない' do
        @order_address.phone_number = 'aaaaa111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 は数字を入力してください")
      end
      it 'phone_numberは全角英数字では購入できない' do
        @order_address.phone_number = 'sssss１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 は数字を入力してください")
      end
      it 'phone_numberは全角英字では購入できない' do
        @order_address.phone_number = 'sssssssssss'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 は数字を入力してください")
      end
      it 'phone_numberは全角数字では購入できない' do
        @order_address.phone_number = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号 は数字を入力してください")
      end
      it 'user_idは空では購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idは空では購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end