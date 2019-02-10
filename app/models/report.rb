# frozen_string_literal: true

class Report < ApplicationRecord
  ##### ASSOCIATIONS
  belongs_to :user
  belongs_to :comment
end
