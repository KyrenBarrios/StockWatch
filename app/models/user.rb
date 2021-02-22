class User < ApplicationRecord
  has_many :stocks
  has_many :comments
  has_many :commented_posts, through: :comments, source: :stock
  has_secure_password  
  has_many :categories, through: :stocks

  validates :username, :email, presence: true

  def self.most_active
    joins(:stocks).group(:user_id).order("count(user_id) DESC").limit(3)
  end
end


