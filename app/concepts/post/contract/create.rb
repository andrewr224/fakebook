# frozen_string_literal: true

module Post::Contract
  class Create < Reform::Form
    property :body, validates: { presence: true, length: { in: 5..500 } }
    property :user, validates: { presence: true }
  end
end
