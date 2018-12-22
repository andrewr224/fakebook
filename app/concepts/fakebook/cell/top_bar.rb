# frozen_string_literal: true

module Fakebook
  module Cell
    class TopBar < Trailblazer::Cell
      def signed_in?
        options[:current_user].present?
      end

      def user_name
        "#{profile.first_name} #{profile.last_name}" if profile.present?
      end

      def sessions_controller?
        options[:controller_name].inquiry.user_sessions?
      end

      private

      def profile
        options[:current_user]&.profile
      end
    end
  end
end
