＃テーブル設計

## users テーブル

|Column                |Type    |Options                      |
|----------------------|--------|---------------------------- |
|nickname              | string | null : false                |
|email                 | string | null : false, unique : true |
|password              | string | null : false                |
|password_confirmation | string | null : false                |
|family_name           | string | null : false                |
|first_name            | string | null : false                |
|family_name(kana)     | string | null : false                |
|first_name (kana)     | string | null :false                 |
|birth                 | date   | null : false                |

### Association

- has_many :items
- has_many :orders
## items テーブル

|Column         |Type        |Options                    |
|---------------|------------|---------------------------|
|image          | text       | null : false              |
|name           | string     | null : false              |
|introduction   | text       | null : false              |
|category       | integer    | null : false              |
|status         | integer    | null : false              |
|shipping_cost  | integer    | null : false              |
|region         | integer    | null : false              |
|number_of_days | integer    | null : false              |
|price          | integer    | null : false              |
|commission     | integer    | null : false              |
|profit         | integer    | null : false              |
|user           | references | null : false, foreign_key |

### Association

- belongs_to :user
- has_one   :order

 ## orders テーブル

|Column|Type        |Options                         |
|------|------------|--------------------------------|
| user | integer    | null: false, foreign_key: true |
| item | integer    | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many   :shipping

## shipping テーブル

|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
| post_code     | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :orders