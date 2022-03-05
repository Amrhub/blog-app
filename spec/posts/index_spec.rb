require 'rails_helper'

RSpec.describe Post, type: :feature do
  before :each do
    User.create(id: 1, name: 'Test', email: 'test@test.com',
      photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg', 
      password: 'test1234', role: 'user', confirmed_at: Time.now, bio: 'test bio')

    User.create(id: 2, name: 'Test2', email: 'test2@test.com',
        photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg', 
        password: 'test1234', role: 'user', confirmed_at: Time.now, posts_counter: 10, bio: 'test bio 2')

    Post.create(id: 1, title: 'first post', text: 'first subject, hello world', user_id: 1)
    Post.create(id: 2, title: 'second post', text: 'second subject, hello world', user_id: 1)
    Post.create(id: 3, title: 'third post', text: 'third subject, hello world', user_id: 1)
    Post.create(id: 4, title: 'Fourth post', text: 'Fourth subject, hello world', user_id: 1)

    Comment.create(id: 1, text: 'first comment', user_id: 1, post_id: 1)

    Like.create(id: 1, user_id: 1, post_id: 1)
    Like.create(id: 2, user_id: 2, post_id: 1)

    visit '/users/1/posts'
  end

  describe 'when visiting the index page' do
    it "Should be able to see user's profile" do
      expect(page).to have_css('img')
    end

    it "Should be able to see user's name" do
      expect(page).to have_text('Test')
    end

    it "Should be able to see number of posts a user written" do
      expect(page).to have_text('4')
    end

    it "Should be able to see a post's title" do
      expect(page).to have_text('first post')
    end

    it "Should be able to see some post's body" do
      expect(page).to have_text('first subject, hello world')
    end

    it "Should be displaying post's recent 5 comments" do
      expect(page).to have_text('first comment')
    end

    it "Should be displaying comments count of a post" do
      expect(page).to have_text('Comments: 1')
    end

    it "Should be displaying likes count of a post" do
      expect(page).to have_text('Likes: 2')
    end

    it "Should redirect to post's show page when clicked" do
      click_link('Fourth post', :match => :first)
      expect(page).to have_text('Fourth subject, hello world')
    end
  end
end