# frozen_string_literal: true

module Post::Cell
  class Show < Trailblazer::Cell
    include ActionView::RecordIdentifier
  end
end
