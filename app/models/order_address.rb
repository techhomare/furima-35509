class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: " is invalid. Input only number"}
    validates :user_id
    validates :item_id
   end
    validates :prefectures_id, numericality: {other_than: 1, message: "can't be blank"}

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
    end
  end


  
