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
| birthday           | string | null: false |
- has_many :items
- has_many :purchaserecords

## items
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| picture            | string | null: false |
| name               | string | null: false |
| text               | text   | null: false |
| time               | datetime | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true|
| category           | string | null: false |
| situation          | string | null: false |
| prefecture_id      | integer | null: false |
| arrives_day_id     | integer | null: false |
| deliverystyle_id   | integer | null: false |
- has_one :shipping_address
- has_one :purchaserecord
- belongs_to :user

## purchaserecords
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | foreign_key: true|
| item               | references | foreign_key: true|
| time               | datetime | null: false|
- belongs_to :user
- belongs_to :item

## shipping_address
| Column                      | Type   | Options     |
| --------------------------- | ------ | ----------- |
| post_code                   | string | null: false |
| prefecture_id               | integer | null: false |
| city_id                     | integer | null: false |
| town_id                     | integer | null: false |
| street_id                   | integer | null: false |
| building_id                 | integer |             |
| phone_number                | string | null: false |
| item                        | references | null: false foreign_key: true|
- belongs_to :item
