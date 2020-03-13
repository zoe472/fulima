# データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|familyname|string|null: false|
|name|string|null: false|
|kana_familyname|string|null: false|
|kana_name|string|null: false|
|birthday|date|null: false|

### Association
- has_one :address
- has_many :credits
- has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_many :goods
- has_many :commnets


# addressテーブル
|Column|Type|Options|
|------|----|-------|
|familyname|string|null: false|
|name|string|null: false|
|kana_familyname|string|null: false|
|kana_name|string|null: false|
|postalcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment|string|
|cellphone|integer|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user, optional: true


# creditテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|expiration-date|date|null: false|
|security-code|integer|null: false|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user


## itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|size|string|null: false|
|status|string|null: false|
|charge|integer|null: false|
|region|string|null: false|
|price|integer|null: false|
|date|integer|null: false|
|seller_id|integer|foreign_key: true|
|buyer_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|

### Association
- belongs_to :seller, foreign_key: "seller_id", class_name: "User"
- belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
- has_many :goods
- has_mnany :commnets
- has_many :pictures
- has_many :categories_items
- has_many :categories, through: :categories_items
- belongs_to :brand


## goodテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|item_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## commentテーブル
|Column|Type|Options|
|------|----|-------|
|sentence|text|null: false|
|user_id|integer|foreign_key: true|
|item_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## pictureテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|foreign_key: true|

### Association
- belongs_to :item


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :categories_items
- has_many :items, through: :categories_items


## category_itemテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category


## ER図
https://gyazo.com/a2d2b91c81491a301c506021793e1c4c