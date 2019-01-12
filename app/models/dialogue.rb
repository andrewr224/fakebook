# frozen_string_literal: true

class Dialogue < ApplicationRecord
  has_and_belongs_to_many :users

  has_many :messages, inverse_of: :dialogue, dependent: :destroy
end
