class Item < ApplicationRecord
  belongs_to :seller, foreign_key: "seller_id", class_name: "User"
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User", optional: true
  has_many :goods
  has_many :comments
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items

  validates :name, :description, :price, :category, :seller_id, presence: true
  validates :status, :charge, :region, :date, presence: { message: 'を選択してください' }
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  validates_associated :pictures
  validates :pictures, presence: { message: 'は１枚以上５枚以内必要です' }

  def previous
    Item.find_by("id < ?",self.id)
  end

  def next
    Item.find_by("id > ?", self.id)
  end

  scope :search, -> (search){where('name LIKE(?)', "%#{search}%")}

end
