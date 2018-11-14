# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    run User::Create::Present
    render cell(User::Cell::New, @form)
  end

  def create
    run User::Create do |result|
      return redirect_to user_path(result["model"])
    end

    render cell(User::Cell::New, @form)
  end

  def show
    run User::Show
    render cell(User::Cell::Show, result["model"])
  end
end
