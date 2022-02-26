require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    User.create(id: 1, name: 'user1')
    Post.create(id: 2, title: 'Test title', user_id: 1, comments_counter: 1, likes_counter: 23,
                text: 'first subject, hello world')
  end

  it 'Should update comments_counter' do
    Comment.create(text: 'first comment', user_id: 1, post_id: 2)
    expect(Post.last.comments_counter).to eq 2
  end
end
