# frozen_string_literal: true

class User::Delete < Trailblazer::Operation
  step Model(User, :find_by)
  step :ensure_same_user!
  step :delete!

  def ensure_same_user!(_options, model:, params:, **)
    model == params[:current_user]
  end

  def delete!(_options, model:, **)
    model.destroy
  end
end
