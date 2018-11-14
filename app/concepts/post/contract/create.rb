# frozen_string_literal: true

module Post::Contract
  class Create < Reform::Form
    property :body, validates: { presence: true }
    property :user, validates: { presence: true }
  end
end
