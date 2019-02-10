# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comment', type: :request do
  describe 'GET index' do
    it 'returns http status 200 (ok)' do
      get api_v1_comments_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET index with params flagged==true' do
    it 'returns flagged comments' do
      get api_v1_comments_path, params: { flagged: 'true' }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create with correct params' do
    it 'creates a comment' do
      post api_v1_comments_path, params: { comment: { text: 'My comment', user_id: User.first.id, event_id: Event.first.id } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'POST create with incorrect params' do
    it 'returns http status 422 (unprocessable_entity)' do
      post api_v1_comments_path, params: { comment: { text: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
