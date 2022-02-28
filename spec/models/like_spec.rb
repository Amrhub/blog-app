require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    User.create(id: 1, name: 'user1')
    Post.create(id: 1, title: 'Test title', user_id: 1, comments_counter: 1, likes_counter: 23,
                text: 'first subject, hello world')
  end

  it 'should auto increment likes_counter' do
    Like.create(user_id: 1, post_id: 1)
    expect(Post.last.likes_counter).to eq 24
  end
end
