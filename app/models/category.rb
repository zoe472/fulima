class Category < ApplicationRecord
  has_many :categories_items
  has_many :items, through: :categories_items
end
