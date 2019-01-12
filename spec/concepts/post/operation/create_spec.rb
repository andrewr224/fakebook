# frozen_string_literal: true

require "rails_helper"

describe Post::Create do
  subject(:result) { described_class.(params) }

  let(:params)            { controller_params.merge(additional_params) }
  let(:controller_params) { { post: post_params } }
  let(:post_params)       { attributes_for(:post) }
  let(:additional_params) { { "current_user" => current_user } }
  let(:current_user)      { create(:user) }

  it "is successful" do
    expect(result).to be_success
  end

  it "creates a new post" do
    expect { result } .to change(Post, :count).by(1)
  end

  it "returns a post model" do
    expect(result["model"]).to be_a Post
  end

  context "with invalid params" do
    let(:post_params) { attributes_for(:post).merge(body: nil) }

    it "is a failure" do
      expect(result).to be_failure
    end

    it "doesn't create a new post" do
      expect { result } .not_to change(Post, :count)
    end

    it "returns a post model" do
      expect(result["model"]).to be_a Post
    end

    context "without a user" do
      let(:post_params)  { attributes_for(:post) }
      let(:current_user) { nil }

      it "is a failure" do
        expect(result).to be_failure
      end

      it "doesn't create a new post" do
        expect { result } .not_to change(Post, :count)
      end
    end
  end
end
