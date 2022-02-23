class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  after_save :update_post_counter

  def recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    user.increment!(:postsCounter)
  end
end
