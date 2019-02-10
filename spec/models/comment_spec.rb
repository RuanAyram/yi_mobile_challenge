# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'when testing associations' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end

  context 'when testing validations' do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:event_id) }
  end
end
