# frozen_string_literal: true

require "rails_helper"

describe Post::Index do
  subject(:result) { described_class.() }

  it "is successful" do
    expect(result).to be_success
  end

  context "when there are posts" do
    let(:post_count) { rand(1..3) }

    before { create_list(:post, post_count) }

    it "returns all posts" do
      expect(result["model"].length).to eq(post_count)
    end
  end

  context "when there are no posts" do
    it "doesn't return any posts" do
      expect(result["model"].length).to eq(0)
    end
  end
end
