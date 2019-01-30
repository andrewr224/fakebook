# frozen_string_literal: true

class Message::Index < Trailblazer::Operation
  step    :current_user!
  step    :find_user!
  step    :ensure_different_user!
  step    :dialogue!

  def current_user!(options, params:, **)
    options["current_user"] = params[:current_user]
  end

  def find_user!(options, params:, **)
    options["user"] = User.find_by(id: params[:user_id])
  end

  def ensure_different_user!(_options, user:, current_user:, **)
    user != current_user
  end

  def dialogue!(options, current_user:, user:, **)
    options["model"] =
      current_user.dialogues.find_by(id: user.dialogue_ids) ||
      Dialogue.create(users: [current_user, user])
  end
end
