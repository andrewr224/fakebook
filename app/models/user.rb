# frozen_string_literal: true

class User < ApplicationRecord
  has_one :profile, inverse_of: :user, dependent: :destroy

  authenticates_with_sorcery!
end
