# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :process_params!, only: [:create]

  def index; end

  def new
    run Post::New
    render cell(Post::Cell::New, @form)
  end

  def create
    run Post::Create do |result|
      return redirect_to post_path(result["model"]), notice: success_notice
    end

    render cell(Post::Cell::New, @form)
  end

  def show
    run Post::Show
    render cell(Post::Cell::Show, result["model"])
  end

  private

  def success_notice
    "Your Post has been created!"
  end

  def process_params!
    params.merge!("current_user" => current_user)
  end
end
