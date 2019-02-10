# frozen_string_literal: true

class AddFlaggedToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :flagged, :boolean, default: false
  end
end
