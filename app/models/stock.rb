class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  

  
  #category_attributes=(attributes)
  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:category_name].blank?
  end


  scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

  
  
end

  
