class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は（ー）を入れてください"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: " は数字を入力してください"}
    validates :user_id
    validates :item_id
   end
    validates :prefectures_id, numericality: {other_than: 1, message: "を選択してください"}

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
    end
  end


  
