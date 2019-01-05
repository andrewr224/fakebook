# frozen_string_literal: true

module Profile::Contract
  class Update < Reform::Form
    property :first_name, validates: { presence:  true }
    property :last_name,  validates: { presence:  true }
    property :birthday,   writeable: false
    property :sex,        writeable: false

    property :about_me
  end
end
