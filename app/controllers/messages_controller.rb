# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :merge_current_user!, only: [:index, :create]

  def index
    run Message::Index do |result|
      return render cell(Message::Cell::Index, result["model"])
    end

    flash[:alert] = "Something went wrong"
    redirect_back fallback_location: root_path
  end

  def create
    run Message::Create do
      return redirect_back fallback_location: root_path
    end

    flash[:alert] = "Something went wrong"
    redirect_back fallback_location: root_path
  end

  private

  def merge_current_user!
    params.merge!("current_user" => current_user)
  end
end
