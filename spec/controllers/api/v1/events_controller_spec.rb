# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::EventsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get api_v1_comments_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get api_v1_comment_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      post api_v1_comments_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #update' do
    it 'returns http success' do
      get api_v1_comment_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get api_v1_comment_path
      expect(response).to have_http_status(:success)
    end
  end
end
