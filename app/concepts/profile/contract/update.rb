# frozen_string_literal: true

module Profile::Contract
  class Update < Reform::Form
    property :first_name, validates: { presence:  true, length: { in: 3..20 } }
    property :last_name,  validates: { presence:  true, length: { in: 3..20 } }
    property :birthday,   writeable: false
    property :sex,        writeable: false

    property :about_me, validates: { length: { in: 6..50 }, allow_nil: true }
  end
end
