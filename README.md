# テーブル設計

## usersテーブル

| Column    | Type    | Options                   |
| --------- | ------- | ------------------------- |
| nickname  | string  | null: false               |
| email     | string  | null: false, unique: true |
| password  | string  | null: false               |
| name      | string  | null: false               |
| name_kana | string  | null: false               |
| birthday  | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| seller           | string     | null: false                    |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| delivery_charge  | string     | null: false                    |
| shipment_source  | string     | null:false                     |
| day_to_ship      | string     |  null:false                    |
| price            | integer    | null: false                    |
| sales_commission | integer    | null: false                    |
| sales_profit     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyer            | string     | null: false                    |
| product_name     | string     | null: false                    |
| price            | integer    | null: false                    |
| delivery_charge  | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column        | Type    | Options     |
| --------------| ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | string  | null: false |
| municipality  | string  | null: false |
| address       | integer | null: false |
| building_name | string  | null: false |
| phone_number  | integer | null: false |

### Association

- belongs_to :order