class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_expense_id, null: false
      t.integer :prefectures_id, null: false
      t.integer :fixed_date_id, null: false
      t.timestamps
    end
  end
end