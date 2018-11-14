# frozen_string_literal: true

module Post::Cell
  class New < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormOptionsHelper
  end
end
