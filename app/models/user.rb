# frozen_string_literal: true

class User < ApplicationRecord
  has_one :profile, inverse_of: :user, dependent: :destroy

  has_many :posts,    inverse_of: :user, dependent: :destroy
  has_many :messages, inverse_of: :user, dependent: :destroy

  has_and_belongs_to_many :dialogues

  authenticates_with_sorcery!
end
