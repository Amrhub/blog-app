require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    User.create(id: 1, name: 'Test', email: 'test@test.com',
                photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg',
                password: 'test1234', role: 'user', confirmed_at: Time.now)
  end

  subject do
    Post.new(title: 'Test title', user_id: 1, comments_counter: 1, likes_counter: 23,
             text: 'first subject, hello world')
  end

  before { subject.save }

  it 'should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should have a title with length less than 250' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'should have a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'should have a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a comments_counter' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should have a likes_counter' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should have a comments_counter greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should have a likes_counter greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'recent_comments return recent 5 comments' do
    subject.save
    subject.comments << Comment.create(text: 'first comment', user_id: 1)
    subject.comments << Comment.create(text: 'second comment', user_id: 1)
    subject.comments << Comment.create(text: 'third comment', user_id: 1)
    subject.comments << Comment.create(text: 'fourth comment', user_id: 1)
    subject.comments << Comment.create(text: 'fifth comment', user_id: 1)
    expect(subject.recent_comments.size).to eq(5)
  end
end
