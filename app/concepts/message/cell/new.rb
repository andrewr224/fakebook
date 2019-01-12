# frozen_string_literal: true

module Message::Cell
  class New < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormOptionsHelper

    delegate :id, to: :dialogue, prefix: true

    private

    def dialogue
      options[:dialogue]
    end
  end
end
