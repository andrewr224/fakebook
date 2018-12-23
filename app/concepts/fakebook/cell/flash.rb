# frozen_string_literal: true

module Fakebook
  module Cell
    class Flash < Trailblazer::Cell
      def flash
        options[:flash]
      end

      def foundation_class(key)
        case key.to_sym
        when :notice    then "primary"
        when :alert     then "alert"
        when :success   then "success"
        end
      end
    end
  end
end
