require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before :each do
    User.create(id: 1, name: 'Test', email: 'test@test.com',
                photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg',
                password: 'test1234', role: 'user', confirmed_at: Time.now, bio: 'test bio')

    User.create(id: 2, name: 'Test2', email: 'test2@test.com',
                photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg',
                password: 'test1234', role: 'user', confirmed_at: Time.now, posts_counter: 10, bio: 'test bio 2')

    Post.create(id: 1, title: 'first post', text: 'first subject, hello world', user_id: 1)

    Comment.create(id: 1, text: 'first comment', user_id: 1, post_id: 1)
    Comment.create(id: 2, text: 'second comment', user_id: 2, post_id: 1)

    Like.create(id: 1, user_id: 1, post_id: 1)
    Like.create(id: 2, user_id: 2, post_id: 1)

    visit '/users/1/posts/1'
  end

  describe 'when visiting the post page' do
    it "Should display the post's title" do
      expect(page).to have_text('first post')
    end

    it "Should be displaying the post's author" do
      expect(page).to have_text("By\nTest")
    end

    it 'Should be displaying how many comments the post has' do
      expect(page).to have_text('Comments: 2')
    end

    it 'Should be displaying how many likes the post has' do
      expect(page).to have_text('Likes: 2')
    end

    it "Should be displaying the post's body" do
      expect(page).to have_text('first subject, hello world')
    end

    it 'Should be displaying the usernames of each comment' do
      expect(page).to have_text('Test')
      expect(page).to have_text('Test2')
    end

    it "Should be displaying the comments' bodies" do
      expect(page).to have_text('first comment')
      expect(page).to have_text('second comment')
    end
  end
end
