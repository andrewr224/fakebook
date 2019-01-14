# frozen_string_literal: true

module User::Cell
  class User < Trailblazer::Cell
    include ActionView::RecordIdentifier

    def profile
      @profile ||= model.profile
    end

    def full_name
      "#{profile.first_name} #{profile.last_name}"
    end
  end
end
