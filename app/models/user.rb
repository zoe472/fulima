class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, :familyname, :name, :kana_familyname, :kana_name, :birthday ,presence: true
  #メールアドレスのフォーマットを指定
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  #名前の入力を全角のみに指定
  VALID_NAME_REGEX = /^[一-龥ぁ-ん]/
  validates :familyname, :name, :kana_familyname, :kana_name, format: { with: VALID_NAME_REGEX }
end
