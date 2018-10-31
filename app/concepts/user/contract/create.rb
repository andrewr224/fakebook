# frozen_string_literal: true

module User::Contract
  class Create < Reform::Form
    property :email
    property :password
    property :password_confirmation, virtual: true, empty: true

    validates :email, presence: true, format: { with: %r{\A[^@\s]+@[^@\s]+\z} }
    validates_uniqueness_of :email
    validates :password, presence:     true,
                         confirmation: true,
                         length:       { minimum: 4 }
  end
end
