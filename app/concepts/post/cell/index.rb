# frozen_string_literal: true

module Post::Cell
  class Index < Trailblazer::Cell
    include ActionView::RecordIdentifier
  end
end
