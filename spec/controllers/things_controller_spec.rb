require 'spec_helper'

describe ThingsController do

  before(:each) do
    @request.env['HTTP_REFERER'] = 'http://localhost:3000/'
  end

  describe "GET 'get_knowledge'" do
    it 'returns http redirect' do
      get :get_knowledge, { thing_names: 'test, test2' }

      expect(response).to be_redirect
    end
  end

  describe "POST 'set_knowledge'" do
    it 'returns http redirect' do
      post :set_knowledge, { thing_names: 'test, test2' }

      expect(response).to be_redirect
    end
  end

end
