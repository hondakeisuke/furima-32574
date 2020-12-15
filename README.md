＃テーブル設計

## users テーブル

|  Column             |  Type   |  Option                      |
| ------------------- | -------- | --------------------------- |
|  nickname           |  string  |  null: false                |  
|  email              |  string  |  null: false, unique: true  |
|  password           |  string  |  null: false                |
|  last_name          |  string  |  null: false                |
|  first_name         |  string  |  null: false                |
|  last_name_reading  |  string  |  null: false                |
|  first_name_reading |  string  |  null: false                |
|  birthday           |  date    |  null: false                |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

|  Column           |  Type        |  Option                         |
| ----------------- | ------------ | ------------------------------- |
|  items＿name      |  string      |  null: false                    |
|  explanation      |  text        |  null: false                    |
|  category_id      |  integer     |  null: false                    |
|  condition_id     |  integer     |  null: false                    |
|  delivery_free_id |  integer     |  null: false                    |
|  prefecture_id    |  integer     |  null: false                    |
|  delivery_days_id |  integer     |  null: false                    |
|  price            |  integer     |  null: false                    | 
|  user             |  references  |  null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders


## orders テーブル

|  Column   |  Type        |  option                         |
| --------- | ------------ | ------------------------------- |
|  user     |  references  |  null: false, foreign_key: true |
|  item     |  references  |  null: false, foreign_key: true |

### Association 

- belongs_to :user
- belongs_to :item
- has_one :shopping_addresses


## shopping_addresses テーブル

|  Column         |  Type        |  Option                         |
| --------------- | ------------ | ------------------------------- |
|  post_code      |  text        |  null:false                     |
|  prefecture_id  |  integer     |  null:false                     |
|  city           |  string      |  null:false                     |
|  house_number   |  string      |  null:false                     |
|  building_name  |  string      |  null:false                     |
|  tell_number    |  string      |  null:false                     |
|  order          |  references  |  null: false, foreign_key: true |

### Association

belongs_to :order
