require 'rails_helper'

RSpec.describe 'Posts controller', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/1/posts'
    end
    it 'renders template' do
      expect(response).to render_template(:index)
    end

    it 'correct status' do
      expect(response.status).to eq(200)
    end

    it 'body includes correct text' do
      expect(response.body).to include('display list of posts')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1/posts/2'
    end
    it 'renders template' do
      expect(response).to render_template(:show)
    end

    it 'correct status' do
      expect(response.status).to eq(200)
    end

    it 'body includes correct text' do
      expect(response.body).to include('display certain user posts ')
    end
  end
end
