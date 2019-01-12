# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user,     inverse_of: :messages
  belongs_to :dialogue, inverse_of: :messages
end
