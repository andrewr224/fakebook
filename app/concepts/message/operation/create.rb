# frozen_string_literal: true

class Message::Create < Trailblazer::Operation
  step Model(Message, :new)
  step :assign_user!
  step :find_dialogue!
  step :assign_dialogue!
  step :ensure_affiliation!
  step Contract::Build(constant: Message::Contract::Create)
  step Contract::Validate(key: :message)
  step Contract::Persist()

  def assign_user!(options, params:, **)
    options["model"].user = params["current_user"]
  end

  def find_dialogue!(options, params:, **)
    options["dialogue"] = Dialogue.find_by(id: params[:message][:dialogue_id])
  end

  def assign_dialogue!(options, **)
    options["model"].dialogue = options["dialogue"]
  end

  def ensure_affiliation!(options, params:, **)
    options["dialogue"].users.include?(params["current_user"])
  end
end
