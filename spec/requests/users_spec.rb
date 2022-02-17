require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'get renders all users correctly' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response.body).to render_template(:index)
    end

    it 'get renders the correct user' do
      get '/users/42'
      expect(response).to have_http_status(200)
      expect(response.body).to include('42')
    end
  end
end
