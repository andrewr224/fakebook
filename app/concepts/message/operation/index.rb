# frozen_string_literal: true

class Message::Index < Trailblazer::Operation
  step    :current_user!
  step    :find_user!
  step    :ensure_different_user!
  failure :default_dialogue!, fail_fast: true
  step    :find_dialogue!
  failure :create_dialogue!

  def current_user!(options, params:, **)
    options["current_user"] = params[:current_user]
  end

  def find_user!(options, params:, **)
    options["user"] = User.find_by(id: params[:user_id])
  end

  def ensure_different_user!(options, **)
    options["user"] != options["current_user"]
  end

  def default_dialogue!(options, **)
    options["model"] = options["current_user"].dialogues.first
  end

  def find_dialogue!(options, **)
    options["model"] = options["current_user"]
      .dialogues
      .find_by(id: options["user"].dialogue_ids)
  end

  def create_dialogue!(options, **)
    options["model"] = Dialogue.create(
      users: [options["current_user"], options["user"]]
    )
  end
end
