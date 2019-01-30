# frozen_string_literal: true

class Message::Create < Trailblazer::Operation
  step Model(Message, :new)
  step :current_user!
  step :dialogue!
  step :assign_user!
  step :assign_dialogue!
  step :ensure_affiliation!
  step Contract::Build(constant: Message::Contract::Create)
  step Contract::Validate(key: :message)
  step Contract::Persist()

  def current_user!(options, params:, **)
    options["current_user"] = params["current_user"]
  end

  def dialogue!(options, params:, **)
    options["dialogue"] = Dialogue.find_by(id: params[:message][:dialogue_id])
  end

  def assign_user!(_options, model:, current_user:, **)
    model.user = current_user
  end

  def assign_dialogue!(_options, model:, dialogue:, **)
    model.dialogue = dialogue
  end

  def ensure_affiliation!(_options, dialogue:, current_user:, **)
    dialogue.users.include?(current_user)
  end
end
