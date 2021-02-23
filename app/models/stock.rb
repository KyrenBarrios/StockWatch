class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  validates :content, :name, presence: true

  delegate :category_name, to: :category

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:category_name].blank?
  end

end

  
