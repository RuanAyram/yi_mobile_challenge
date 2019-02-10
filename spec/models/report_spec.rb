# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Report, type: :model do
  context 'when testing associations' do
    it { should belong_to(:user) }
    it { should belong_to(:comment) }
  end
end
