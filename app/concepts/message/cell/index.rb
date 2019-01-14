# frozen_string_literal: true

module Message::Cell
  class Index < Trailblazer::Cell
    include ActionView::RecordIdentifier

    def messages
      @messages ||= model.messages
    end

    def user_name
      "#{profile.first_name} #{profile.last_name}" if profile.present?
    end

    def new_message
      Message.new
    end

    private

    delegate :profile, to: :user, allow_nil: true

    def user
      @user || User.find_by(id: params[:user_id])
    end
  end
end
