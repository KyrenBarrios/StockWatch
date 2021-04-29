class Category < ApplicationRecord
  has_many :stocks
  validates :category_name, uniqueness: true
end
