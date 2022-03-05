require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    User.create(id: 1, name: 'Test', email: 'test@test.com',
      photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg', 
      password: 'test1234', role: 'user', confirmed_at: Time.now)
    Post.create(id: 2, title: 'Test title', user_id: 1, comments_counter: 1, likes_counter: 23,
                text: 'first subject, hello world')
  end

  it 'Should update comments_counter' do
    Comment.create(text: 'first comment', user_id: 1, post_id: 2)
    expect(Post.last.comments_counter).to eq 2
  end
end
