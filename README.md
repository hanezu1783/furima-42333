# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_reading       | string | null: false               | 
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |
| description        | text       | null: false |
| category           | string     | null: false |
| condition          | string     | null: false |
| shipping_cost      | string     | null: false |
| shipping_area.     | string     | null: false |
| shipping_days      | string     | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_addresses


## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases