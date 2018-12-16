# frozen_string_literal: true

module Fakebook
  module Cell
    class TopBar < Trailblazer::Cell
      def signed_in?
        options[:current_user].present?
      end

      def user_email
        options[:current_user].email
      end

      def sessions_controller?
        options[:controller_name].inquiry.user_sessions?
      end
    end
  end
end
