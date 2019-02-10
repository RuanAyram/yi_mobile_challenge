# frozen_string_literal: true

class Event < ApplicationRecord
  ##### ASSOCIATIONS
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  ##### VALIDATIONS
  validates :name, :description, :lat, :lng, presence: true
end
