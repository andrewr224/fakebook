# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :process_params!, only: :create

  def index
    run Post::Index
    render cell(Post::Cell::Index, result["model"])
  end

  def new
    run Post::New
    render cell(Post::Cell::New, @form)
  end

  def create
    run Post::Create do |_|
      return redirect_to posts_path, notice: "Your Post has been created!"
    end

    render cell(Post::Cell::New, @form)
  end

  def show
    run Post::Show do |result|
      return render cell(Post::Cell::Show, result["model"])
    end

    redirect_to posts_path, alert: "Record not found."
  end

  private

  def process_params!
    params.merge!("current_user" => current_user)
  end
end
