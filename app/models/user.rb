# frozen_string_literal: true

class User < ApplicationRecord
  ##### ASSOCIATIONS
  has_many :comments, dependent: :destroy
  has_many :events, through: :comments
  has_many :reports, dependent: :nullify

  ##### VALIDATIONS
  validates :name, :email, :password, presence: true
end
