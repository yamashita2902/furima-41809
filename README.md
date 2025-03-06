## users
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_name          | string | null: false |
| user_email         | string | null: false, unique: true |
| user_encrypted_password | string | null: false |
| user_name_ZENKAKU  | string | null: false |
| user_name_KANA     | string | null: false |

## items
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_picture       | string | null: false |
| item_name          | string | null: false |
| item_text          | string | null: false |
| item_time          | string | null: false |
| user_id            | string | null: false, foreign_key: true|
| Item_category      | string | null: false |
| Item_situation     | string | null: false |
| Item_area          | string | null: false |
| Item_arrives_day   | string | null: false |
| Item_price         | string | null: false |
| Item_deliverystyle | string | null: false |


## comments
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | string | null: false foreign_key: true|
| comment            | string | null: false |
| item_id            | string | null: false foreign_key: true|

## purchaserecords
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | string | foreign_key: true|
| item_id            | string | foreign_key: true|

## shipping_address
| Column                      | Type   | Options     |
| --------------------------- | ------ | ----------- |
| shipping_address_post_code  | string | null: false |
| shipping_address_prefecture | string | null: false |
| shipping_address_city       | string | null: false |
| shipping_address_town       | string | null: false |
| shipping_address_street     | string | null: false |
| shipping_address_building   | string |             |
| shipping_address_phone_number| string | null: false |
| item_id                     | string | null: false foreign_key: true|

## item_categorys
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| category_id        | string | null: false foreign_key: true|
| item_id            | string | null: false foreign_key: true|

## categorys
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| category_name      | string | null: false |
