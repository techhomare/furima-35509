class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.integer :price
      t.integer :category_id
      t.integer :condition_id
      t.integer :delivery_expense_id
      t.integer :prefectures_id
      t.integer :fixed_date_id
      t.timestamps
    end
  end
end