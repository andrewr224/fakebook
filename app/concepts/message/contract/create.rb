# frozen_string_literal: true

module Message::Contract
  class Create < Reform::Form
    property :text,     validates: { presence: true }
    property :user,     validates: { presence: true }
    property :dialogue, validates: { presence: true }
  end
end
