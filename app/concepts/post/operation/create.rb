# frozen_string_literal: true

class Post::Create < Trailblazer::Operation
  step Model(Post, :new)
  step :assign_user!
  step Contract::Build(constant: Post::Contract::Create)
  step Contract::Validate(key: :post)
  step Contract::Persist()

  def assign_user!(options, **)
    options["model"].user = options["params"]["current_user"]
  end
end
