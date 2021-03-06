# frozen_string_literal: true

module Fakebook
  module Cell
    class TopBar < Trailblazer::Cell
      def signed_in?
        current_user.present?
      end

      def current_user
        @current_user ||= options[:current_user]
      end

      def user_name
        "#{profile.first_name} #{profile.last_name}" if profile.present?
      end

      def sessions_controller?
        options[:controller_name].inquiry.user_sessions?
      end

      private

      def profile
        current_user&.profile
      end
    end
  end
end
