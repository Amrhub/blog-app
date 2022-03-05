require 'rails_helper'

RSpec.describe User, type: :feature do
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

    visit '/users/1'
  end

  describe 'when visiting the user profile page' do
    it "Should be able to see user's profile" do
      expect(page).to have_text('Test')
    end

    it 'Should be able to see number of posts a user written' do
      expect(page).to have_text('4')
    end

    it "Should be able to see user's bio" do
      expect(page).to have_text('test bio')
    end

    it "Should be able to see user's only the recent 3 posts" do
      expect(page).to_not have_text('first post')
      expect(page).to have_text('second post')
      expect(page).to have_text('third post')
      expect(page).to have_text('Fourth post')
    end

    it 'Should be see a link to see all posts' do
      expect(page).to have_link('See all posts')
    end

    it 'Should redirect to the correct post when clicked' do
      click_link('third post', match: :first)
      expect(page).to have_text("By\nTest")
      expect(page).to have_text('third subject, hello world')
    end

    it 'When user click on the link to see all posts, it should redirect to the correct page' do
      click_link('See all posts')
      expect(page).to have_text('first post')
    end
  end
end
