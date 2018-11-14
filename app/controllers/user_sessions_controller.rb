# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new
    render cell(UserSession::Cell::New, @form)
  end

  def create
    @user = login(params[:email], params[:password])
    return redirect_to user_path(@user), notice: "Welcome back, user!" if @user

    flash.now[:alert] = "Login failed"
    render cell(UserSession::Cell::New, @form)
  end

  # def destroy
  #   logout
  #   redirect_to(:users, notice: 'Logged out!')
  # end
end
