# README

## テーブル設計

### users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| encrypt_password | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| ruby_first_name  | string | null: false |
| ruby_last_name   | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many : items 
- has_many : orders

#### items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |
| image               |            | null: false |
| user_id             | references | null: false |
| price               | integer    | null: false |
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| delivery_expense_id | integer    | null: false |
| ship_form_area_id   | integer    | null: false |
| fixed_date_id       | integer    | null: false |

#### Association

- belongs_to : user
- has_one : order

##### orders テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user_id   | references | null: false |
| items_id  | references | null: false |

##### Association

- belongs_to : item
- has_one : address

###### addresses テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefectures_id | integer    | null: false |
| municipality   | string     | null: false |
| address        | string     | null: false |
| building       | string     |             |
| phone_number   | string     | null: false |
| orders_id      | references | null: false |

###### Association

- belongs_to : order