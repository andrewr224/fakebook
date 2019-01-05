# frozen_string_literal: true

module User::Contract
  class Update < Reform::Form
    property :email,    writeable: false
    property :password, writeable: false

    property :profile, form: Profile::Contract::Update
  end
end
