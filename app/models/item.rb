class Item < ApplicationRecord
  validates :name, :description, :size, :charge, :status, :region, :price, :date, :seller_id, presence: true

  belongs_to :seller, foreign_key: "seller_id", class_name: "User"
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User", optional: true
  has_many :goods
  has_many :comments
  has_many :pictures
  has_many :category_items
  has_many :categories, through: :category_items
  
  def previous
    Item.find_by("id < ?",self.id)
  end

  def next
    Item.find_by("id > ?", self.id)
  end

  scope :search, -> (search){where('name LIKE(?)', "%#{search}%")}

end
