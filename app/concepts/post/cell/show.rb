# frozen_string_literal: true

module Post::Cell
  class Show < Trailblazer::Cell
    include ActionView::RecordIdentifier

    delegate :profile, to: :author

    def author_name
      "#{profile.first_name} #{profile.last_name}"
    end

    def author
      model.user
    end
  end
end
