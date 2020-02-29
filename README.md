# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|kanzi name|string|null: false|
|kanzi name|string|null: false|
|kana name|string|null: false|
|kana name|string|null: false|
|year|date|null: false|

### Association
- has_many :sells
- has_many :buys

## sellテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|
|name|string|null: false|
|description|string|null: false|
|categories|string|null: false|
|condition|string|null: false|
|delivery charge|string|null: false|
|area|string|null: false|
|days|string|null: false|
|price|integer|null: false|

### Association
belongs_to :user


## buyテーブル
|Column|Type|Options|
|------|----|-------|
|card number|integer|null: false|
|deadline|integer|null: false|
|deadline|integer|null: false|
|code|integer|null: false|

### Association
- belongs_to :user

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
