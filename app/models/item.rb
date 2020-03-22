class Item < ApplicationRecord
  validates :name, :description, :size, :status, :charge, :region, :price, :date, :seller_id, :buyer_id, :brand_id, presence: true

  belongs_to :seller, foreign_key: "seller_id", class_name: "User"
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
end
