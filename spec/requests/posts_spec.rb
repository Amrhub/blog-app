require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'get renders all posts page correctly' do
      get '/users/120/posts'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('120')
    end

    it 'gets the correct blog for the given user id' do
      get '/users/42/posts/21'
      expect(response).to have_http_status(200)
      expect(response.body).to include('42')
      expect(response.body).to include('21')
    end
  end
end
