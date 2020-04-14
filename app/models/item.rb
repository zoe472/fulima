class Item < ApplicationRecord
  validates :name, :description, :size, :status, :charge, :region, :price, :date, :seller_id, :buyer_id, :brand_id, presence: true

  belongs_to :seller, foreign_key: "seller_id", class_name: "User"
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
  belongs_to :brand
  has_many :goods
  has_many :comments
  has_many :pictures
  has_many :category_items
  has_many :categories, through: :category_items
  
  def previous
    Item.where("id < ?",self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
end
