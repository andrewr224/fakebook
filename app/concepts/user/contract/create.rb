# frozen_string_literal: true

module User::Contract
  class Create < Reform::Form
    property :email, validates: {
      presence: true, format: { with: %r{\A[^@\s]+@[^@\s]+\z} }
    }

    property :password, validates: { presence: true, length: { minimum: 4 } }

    property :profile, form:              Profile::Contract::Create,
                       populate_if_empty: Profile,
                       prepopulator:      :prepopulate_profile!

    validates_uniqueness_of :email

    def prepopulate_profile!
      self.profile = Profile.new
    end
  end
end
