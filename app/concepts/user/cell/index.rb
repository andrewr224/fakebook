# frozen_string_literal: true

module User::Cell
  class Index < Trailblazer::Cell
    include ActionView::RecordIdentifier
  end
end
