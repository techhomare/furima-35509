require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'nameとimege、descriptionとprice、category_idとcondition_id、delivery_expense_idとprefectures_id、fixed_date_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceは300以上9999999以下の値であれば出品できる' do
        @item.price = 301
        expect(@item).to be_valid
      end
      it 'priceは半角数字であれば出品できる' do
        @item.price = 301
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageのファイルを選択しなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが---では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが---では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが---では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'delivery_expense_idが---では出品できない' do
        @item.delivery_expense_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery expense must be other than 1')
      end
      it 'prefectures_idが---では出品できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it 'fixed_date_idが---では出品できない' do
        @item.fixed_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Fixed date must be other than 1')
      end
      it 'priceが300以下の値では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999以上の値では出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceは半角英字では出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは全角文字では出品できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは全角数字では出品できない' do
        @item.price = '３０１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは全角英字では出品できない' do
        @item.price = 'sss'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
