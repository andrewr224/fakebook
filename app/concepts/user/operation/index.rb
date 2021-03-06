# frozen_string_literal: true

class User::Index < Trailblazer::Operation
  step :assign_current_user!
  step :model!

  def assign_current_user!(options, params:, **)
    options["current_user"] = params["current_user"]
  end

  def model!(options, current_user:, **)
    options["model"] = User.where.not(id: current_user.id)
  end
end
