class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  

  

 def self.search(query)
     self.where("name LIKE ?", "%#{query}%")
 end 

  
end

  
