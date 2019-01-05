# frozen_string_literal: true

module User::Cell
  class Edit < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormOptionsHelper
  end
end
