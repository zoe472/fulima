class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :familyname, :name, :kana_familyname, :kana_name, :postalcode, :prefecture, :city, :address, presence: true
  # 郵便番号の入力を数字のみ、かつ７文字に指定
  validates :postalcode, numericality: {only_integer: true}, length: { is: 7}
  # 都道府県と市区町村に数字の入力をできないようにする
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  validates :prefecture, :city, format: { with: VALID_NAME_REGEX, message: "は数値の入力はできません"}
  # 電話番号の入力は数字のみに指定
  validates :cellphone, numericality: {only_integer: true}, allow_blank: true
end
