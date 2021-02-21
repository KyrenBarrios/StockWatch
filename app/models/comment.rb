class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :stock

validates :content, presence: true

  validates :stock, uniqueness: {scope: :user_id, message: "may only have one comment per user"}
end
