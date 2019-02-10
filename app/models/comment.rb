# frozen_string_literal: true

class Comment < ApplicationRecord
  ##### ASSOCIATIONS
  belongs_to :user
  belongs_to :event

  ##### VALIDATIONS
  validates :text, :user_id, :event_id, presence: true

  ##### SCOPES
  scope :flagged, -> { where(flagged: true) }
end
