require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Test', email: 'test@test.com',
    photo: 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/48457/DIG010147_1._SX360_QL80_TTD_.jpg', 
    password: 'test1234', role: 'user', confirmed_at: Time.now)
  }

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a posts_counter' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should have a posts_counter greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should have a posts_counter as integer' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'should have a recent_posts return recent 3 posts' do
    subject.save
    subject.posts << Post.create(title: 'first post', text: 'first subject, hello world')
    subject.posts << Post.create(title: 'second post', text: 'second subject, hello world')
    subject.posts << Post.create(title: 'third post', text: 'third subject, hello world')
    subject.posts << Post.create(title: 'fourth post', text: 'fourth subject, hello world')
    subject.posts << Post.create(title: 'fifth post', text: 'fifth subject, hello world')
    expect(subject.recent_posts.length).to eq 3
  end
end
