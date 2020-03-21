class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :familyname, :name, :kana_familyname, :kana_name, :postalcode, :prefecture, :city, :address, presence: true
end
