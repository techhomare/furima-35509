class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :user
 has_one :order
 has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_expense
  belongs_to :prefectures
  belongs_to :fixed_date

 validates :name, presence: true
 validates :description, presence: true
 validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
 validates :category_id, presence: true, numericality: { other_than: 1 }
 validates :condition_id, presence: true, numericality: { other_than: 1 }
 validates :delivery_expense_id, presence: true, numericality: { other_than: 1 }
 validates :prefectures_id, presence: true, numericality: { other_than: 1 }
 validates :fixed_date_id, presence: true, numericality: { other_than: 1 }

end