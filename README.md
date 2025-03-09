## users
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name_zennkaku_myouzi| string | null: false |
| name_zennkaku_namae| string | null: false |
| name_kana_myouzi   | string | null: false |
| name_kana_namae    | string | null: false |
| birthday           | date   | null: false |
- has_many :items
- has_many :purchaserecords

## items
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| explanation        | text   | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true|
| category_id        | integer | null: false |
| situation_id       | integer | null: false |
| prefecture_id      | integer | null: false |
| arrives_day_id     | integer | null: false |
| deliverystyle_id   | integer | null: false |
- has_one :purchaserecord
- belongs_to :user

## purchaserecords
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true|
| item               | references | null: false, foreign_key: true|
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_address
| Column                      | Type   | Options     |
| --------------------------- | ------ | ----------- |
| post_code                   | string | null: false |
| prefecture_id               | integer | null: false |
| city                        | string | null: false |
| street                      | string | null: false |
| building                    | string |             |
| phone_number                | string | null: false |
| purchaserecord             | references | null: false foreign_key: true|
- belongs_to :purchaserecord
