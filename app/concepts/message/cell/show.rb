# frozen_string_literal: true

module Message::Cell
  class Show < Trailblazer::Cell
    include ActionView::RecordIdentifier

    def author_name
      model.user.profile.first_name
    end
  end
end
