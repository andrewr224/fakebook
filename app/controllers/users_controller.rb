# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :process_params!, only: :create

  skip_before_action :require_login, only: [:new, :create]

  def new
    run User::Create::Present
    render cell(User::Cell::New, @form)
  end

  def create
    run User::Create do
      login(params[:user][:email], params[:user][:password])

      return redirect_to user_path(current_user), notice: welcome_notice
    end

    render cell(User::Cell::New, @form)
  end

  def show
    run User::Show do |result|
      return render cell(User::Cell::Show, result["model"])
    end

    redirect_to root_path, alert: "User not found."
  end

  private

  def welcome_notice
    "Greetings, #{profile.first_name}!"
  end

  def profile
    current_user.profile
  end

  def process_params!
    params["user"].merge!("profile" => params["profile"])
  end
end
