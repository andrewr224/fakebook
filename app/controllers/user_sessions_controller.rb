# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new
    render cell(UserSession::Cell::New, @form)
  end

  def create
    login(params[:email], params[:password])
    return welcome_back if current_user

    flash.now[:alert] = "Login failed"
    render cell(UserSession::Cell::New, @form)
  end

  # def destroy
  #   logout
  #   redirect_to(:users, notice: 'Logged out!')
  # end

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
