# frozen_string_literal: true

class Post::Index < Trailblazer::Operation
  step :model!

  def model!(options, *)
    options["model"] = Post.all.order(id: :desc).includes(:user)
  end
end
