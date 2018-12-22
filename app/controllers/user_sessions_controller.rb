# frozen_string_literal: true

class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    render cell(UserSession::Cell::New, @form)
  end

  def create
    login(params[:email], params[:password])
    return welcome_back if current_user

    flash.now[:alert] = "Login failed"
    render cell(UserSession::Cell::New, @form)
  end

  def destroy
    logout

    redirect_to new_user_path, notice: "Farewell!"
  end

  private

  def welcome_back
    redirect_to user_path(current_user), notice: welcome_notice
  end

  def welcome_notice
    "Welcome back, #{profile.first_name}!"
  end

  def profile
    current_user.profile
  end
end
