# frozen_string_literal: true

module User::Cell
  class Show < Trailblazer::Cell
    def profile
      @profile ||= model.profile
    end

    def birthday
      profile.birthday.strftime("%B, %e")
    end
  end
end
