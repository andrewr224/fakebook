# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :process_create_params!, only: :create
  before_action :process_params!,        only: [:show, :edit, :update]

  skip_before_action :require_login, only: [:new, :create]

  def new
    run User::Create::Present
    render cell(User::Cell::New, @form)
  end

  def create
    run User::Create do |result|
      login(params[:user][:email], params[:user][:password])

      return redirect_to user_path(result["model"]), notice: result["message"]
    end

    render cell(User::Cell::New, @form)
  end

  def show
    run User::Show do |result|
      return render cell(User::Cell::Show, result["model"])
    end

    redirect_to root_path, alert: "User not found."
  end

  def edit
    run User::Update::Present do
      return render cell(User::Cell::Edit, @form)
    end

    redirect_back fallback_location: posts_path,
                  notice:            "You are not allowed to do that."
  end

  def update
    run User::Update do |result|
      flash[:notice] = "Your profile has been successfully updated."
      return redirect_to user_path(result["model"])
    end

    render cell(User::Cell::Edit, @form)
  end

  private

  def process_create_params!
    params["user"].merge!("profile" => params["profile"])
  end

  def process_params!
    params.merge!("current_user" => current_user)
  end
end
