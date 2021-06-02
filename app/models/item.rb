class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_expense
  belongs_to :prefectures
  belongs_to :fixed_date

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_expense_id
      validates :prefectures_id
      validates :fixed_date_id
    end
  end
end
