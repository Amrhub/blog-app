require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    User.create(id: 1, name: 'Test', email: 'test@test.com',
                photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg',
                password: 'test1234', role: 'user', confirmed_at: Time.now)
    Post.create(id: 1, title: 'Test title', user_id: 1, comments_counter: 1, likes_counter: 23,
                text: 'first subject, hello world')
  end

  it 'should auto increment likes_counter' do
    Like.create(user_id: 1, post_id: 1)
    expect(Post.last.likes_counter).to eq 24
  end
end
