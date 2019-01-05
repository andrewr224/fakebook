# frozen_string_literal: true

class UserUpdateGuard
  include Uber::Callable

  def call(options, params:, **)
    params["current_user"] == options["model"]
  end
end
