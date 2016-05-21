class Post < ActiveRecord::Base
  belongs_to :user

  # Order by : newest first
  default_scope -> { order(created_at: :desc) }

  # The text size should be below 10 000 chars in length
  validates :text, length: {maximum: 10000}, presence:true
  # The post should be posted by a user
  validates :user_id, presence: true

end
