class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, :familyname, :name, :kana_familyname, :kana_name, :birthday ,presence: true
  # メールアドレスのフォーマットを指定
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # 名前の入力を全角のみに指定
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :familyname, :name, format: { with: VALID_NAME_REGEX }
  # かなの入力を平仮名全角のみに指定
  VALID_KANANAME_REGEX = /\A[ぁ-ん]+\z/
  validates :kana_familyname, :kana_name, format: { with: VALID_KANANAME_REGEX }

  has_one :address
  has_many :cards, dependent: :destroy
  has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
end
