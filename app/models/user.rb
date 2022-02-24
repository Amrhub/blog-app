class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'

  def recent_posts
    Post.where(user_id: id).order(created_at: :desc).limit(3)
  end
end
