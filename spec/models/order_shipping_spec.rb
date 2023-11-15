require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    end

    context '商品購入できる場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@order_shipping).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'postcodeが空だと購入されない' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postcode が「3桁ハイフン4桁」の半角文字列出なかったら購入されない' do
        @order_shipping.post_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと購入されない' do
        @order_shipping.prefecture_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入されない' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入されない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phonenumberが空だと購入されない' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phonenumberが10桁以上11桁以内の半角数値でないと購入されない' do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Should be 10 to 11 digits')
      end
      it 'phonenumberが数字のみでないと購入されない' do
        @order_shipping.phone_number = 'abcdefghij'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'userが紐づいてないと出品できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいてないと出品できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では出品できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
