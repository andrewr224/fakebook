# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  enum sex: {
    male:   "Male",
    female: "Female"
  }
end
