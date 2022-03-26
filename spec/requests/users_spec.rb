require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users'
    end
    it 'renders template' do
      expect(response).to render_template(:index)
    end

    it 'correct status' do
      expect(response.status).to eq(200)
    end
    it 'body includes correct text' do
      expect(response.body).to include('display list of users')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1'
    end
    it 'renders template' do
      expect(response).to render_template(:show)
    end

    it 'correct status' do
      expect(response.status).to eq(200)
    end
    it 'body includes correct text' do
      expect(response.body).to include('display certain user list of posts')
    end
  end
end
