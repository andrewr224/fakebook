# frozen_string_literal: true

module Fakebook
  module Cell
    class Flash < Trailblazer::Cell
      def flash
        options[:flash]
      end
    end
  end
end
