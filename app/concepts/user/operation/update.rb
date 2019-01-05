# frozen_string_literal: true

class User::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(User, :find_by)
    step Policy::Guard(UserUpdateGuard.new)
    step Contract::Build(constant: User::Contract::Update)
  end

  step Nested(Present)
  step :prepare_params!
  step Contract::Validate(key: :user)
  step Contract::Persist()

  def prepare_params!(_, params, **)
    params[:params][:user] = { profile: params[:params][:profile] }
  end
end
