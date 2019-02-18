# frozen_string_literal: true

module Profile::Contract
  class Create < Reform::Form
    property :first_name, validates: { presence:  true, length: { in: 3..20 } }
    property :last_name,  validates: { presence:  true, length: { in: 3..20 } }
    property :birthday,   validates: { presence:  true }
    property :sex,        validates: { presence:  true,
                                       inclusion: Profile.sexes.keys }
  end
end
