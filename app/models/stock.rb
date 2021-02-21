class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
  validates :content, :name, presence: true
  validate :too_many_stocks

  delegate :category_name, to: :category

  scope :alpha, -> { order(:name) }
  scope :most_comments, -> {left_joins(:comments).group('stocks.id').order('count(comments.stock_id) desc')}

  def self.filter(params)
    where("category_id = ?", params)
  end

  def self.search(params)
    left_joins(:comments).where("LOWER(stocks.name) LIKE :term OR LOWER(stocks.content) LIKE :term OR LOWER(comments.content) LIKE :term", term: "%#{params}%")
    #select any posts with a title that is an exact match to the search term
  end

  def category_attributes=(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:category_name].blank?
  end

  def too_many_stocks
    # are there already 3 posts added to the database with created_at as the current date
    #iterate over user's posts
    today_stocks = user.stocks.select do |p|
      p.created_at.try(:to_date) == Date.today
    end

    if today_stocks.size > 9
      errors.add(:stock_id, "- can't post Stocks more than 10 times per day.")
    end
  end


end

