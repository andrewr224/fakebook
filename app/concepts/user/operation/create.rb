# frozen_string_literal: true

class User::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: User::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
  step :assign_profile!
  step :add_welcome_message!

  def assign_profile!(options, **)
    options["profile"] = options["model"].profile
  end

  def add_welcome_message!(options, **)
    options["message"] = "Greetings, #{options['profile'].first_name}!"
  end
end
