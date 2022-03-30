class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def get_recent_posts
    posts.order("created_at DESC").limit(3)
  end

  def current_user
    USer.first
  end
end
