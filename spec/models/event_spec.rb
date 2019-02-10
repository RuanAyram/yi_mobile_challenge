# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'when testing associations' do
    it { should have_many(:comments) }
  end

  context 'when testing validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lng) }
  end
end
