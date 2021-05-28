# README

## テーブル設計

### users テーブル

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------------------ |
| nickname         | string | null: false              |
| email            | string | null: false,unique: true |
| encrypt_password | string | null: false              |
| first_name       | string | null: false              |
| last_name        | string | null: false              |
| ruby_first_name  | string | null: false              |
| ruby_last_name   | string | null: false              |
| birthday         | date   | null: false              |

### Association

- has_many : items 
- has_many : orders

#### items テーブル

| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| name                | string     | null: false                   |
| description         | text       | null: false                   |
| user                | references | null: false,foreign_key: true |
| price               | integer    | null: false                   |
| category_id         | integer    | null: false                   |
| condition_id        | integer    | null: false                   |
| delivery_expense_id | integer    | null: false                   |
| prefectures_id      | integer    | null: false                   |
| fixed_date_id       | integer    | null: false                   |

#### Association

- belongs_to : user
- has_one : order

##### orders テーブル

| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| user      | references | null: false,foreign_key: true |
| item      | references | null: false,foreign_key: true |

##### Association

- belongs_to : user
- belongs_to : item
- has_one : address

###### addresses テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| prefectures_id | integer    | null: false                   |
| municipality   | string     | null: false                   |
| address        | string     | null: false                   |
| building       | string     |                               |
| phone_number   | string     | null: false                   |
| order          | references | null: false,foreign_key: true |

###### Association

- belongs_to : order