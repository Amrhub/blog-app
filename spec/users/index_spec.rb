require 'rails_helper'

RSpec.describe User, type: :feature do
  before :each do
    User.create(id: 1, name: 'Test', email: 'test@test.com',
      photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg', 
      password: 'test1234', role: 'user', confirmed_at: Time.now, bio: 'test bio')

      User.create(id: 2, name: 'Test2', email: 'test2@test.com',
        photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg', 
        password: 'test1234', role: 'user', confirmed_at: Time.now, posts_counter: 10, bio: 'test bio')
  end

  describe 'when visiting the index page' do
    before :each do
      visit '/users'
    end

    it 'should have the username of all other users.' do
      expect(page).to have_text('Test')
      expect(page).to have_text('Test2')
    end

    it 'should have the photo of all other users.' do
      expect(page).to have_css('img')
    end

    it 'should have the number of posts of all other users.' do
      expect(page).to have_text('Number of posts:')
    end

    it 'should display the number of posts of all other users.' do
      expect(page).to have_text('10')
    end

    it 'should redirect to user profile when clicked' do
      click_link('Test', :match => :first) # "Test2" presents user name :first is a default option for click_link 
      expect(page).to have_text('bio')
    end
  end
end

