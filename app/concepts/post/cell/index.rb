# frozen_string_literal: true

module Post::Cell
  class Index < Trailblazer::Cell
    include ActionView::RecordIdentifier

    def new_post
      Post.new
    end
  end
end
