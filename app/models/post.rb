class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    comment_counter = Comment.where(post_id: id).count

    update(commentsCounter: comment_counter)
  end

  def update_likes_counter
    likes_counter = Like.where(post_id: id).count

    update(likesCounter: likes_counter)
  end
end
