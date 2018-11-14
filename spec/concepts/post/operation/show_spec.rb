# frozen_string_literal: true

require "rails_helper"

describe Post::Show do
  subject(:result) { described_class.(params) }

  let(:params) { { id: post.id } }
  let(:post)   { create(:post) }

  it "is successful" do
    expect(result).to be_success
  end

  it "returns a post" do
    expect(result["model"]).to eq post
  end

  context "when there is no post" do
    let(:post) { build_stubbed(:post) }

    it "is a failure" do
      expect(result).to be_failure
    end

    it "returns nil" do
      expect(result["model"]).to be_nil
    end
  end
end
