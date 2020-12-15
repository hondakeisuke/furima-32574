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
|  birthday           |  integer |  null: false                |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

|  Column         |  Type        |  Option                         |
| --------------- | ------------ | ------------------------------- |
|  image          |  text        |  null: false                    |
|  items＿name    |  string      |  null: false                    |
|  explanation    |  string      |  null: false                    |
|  category       |  integer     |  null: false                    |
|  condition      |  integer     |  null: false                    |
|  delivery_free  |  integer     |  null: false                    |
|  delivery_area  |  integer     |  null: false                    |
|  delivery_days  |  integer     |  null: false                    |
|  price          |  integer     |  null: false                    | 
|  user_id        |  references  |  null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders


## orders テーブル

|  Column   |  Type        |  option                         |
| --------- | ------------ | ------------------------------- |
|  price    |  integer     |  null: false                    |
|  user_id  |  references  |  null: false, foreign_key: true |
|  item_id  |  references  |  null: false, foreign_key: true |

### Association 

- belongs_to :user
- belongs_to :item
- has_many :shopping_addresses


## shopping_addresses テーブル

|  Column         |  Type        |  Option                         |
| --------------- | ------------ | ------------------------------- |
|  post_code      |  text        |  null:false                     |
|  prefecture     |  integer     |  null:false                     |
|  city           |  string      |  null:false                     |
|  house_number   |  string      |  null:false                     |
|  building_name  |  string      |  null:false                     |
|  tell_number    |  integer     |  null:false                     |
|  order_id       |  references  |  null: false, foreign_key: true |

### Association

belongs_to :order
