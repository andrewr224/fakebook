# frozen_string_literal: true

module User::Cell
  class Show < Trailblazer::Cell
    include ActionView::RecordIdentifier

    def profile
      @profile ||= model.profile
    end

    def full_name
      "#{profile.first_name} #{profile.last_name}"
    end

    def birthday
      profile.birthday.strftime("%B, %e")
    end

    def page_owner?
      params["current_user"] == model
    end

    def new_post
      Post.new
    end

    def user_posts
      model.posts
    end
  end
end
