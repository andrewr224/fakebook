# frozen_string_literal: true

class User::Show < Trailblazer::Operation
  step Model(User, :find_by)
end
