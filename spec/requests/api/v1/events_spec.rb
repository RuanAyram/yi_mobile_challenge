# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Event', type: :request do
  before(:all) do
    @event1 = create(:event)
  end

  describe 'GET index' do
    it 'returns http status 200 (ok)' do
      get api_v1_events_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create' do
    it 'creates a event' do
      post api_v1_events_path, params: { event: attributes_for(:event) }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'POST create with incorrect params' do
    it 'returns http status 422 (unprocessable_entity)' do
      post api_v1_events_path, params: { event: { name: 'nil' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
