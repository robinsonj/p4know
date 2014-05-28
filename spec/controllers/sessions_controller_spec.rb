require 'spec_helper'

describe SessionsController do

  before(:each) do
    @request.env['HTTP_REFERER'] = 'http://localhost:3000/'
  end

  describe "POST 'create'" do
    it 'returns http redirect' do
      post :create, { username: 'testuser', password: 'test' }

      expect(response).to be_redirect
    end
  end

  describe "POST 'destroy'" do
    it 'returns http redirect' do
      post :destroy

      expect(response).to be_redirect
    end
  end

end
