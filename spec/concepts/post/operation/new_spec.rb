# frozen_string_literal: true

require "rails_helper"

describe Post::New do
  subject(:result) { described_class.() }

  it "is successful" do
    expect(result).to be_success
  end

  it "returns post model for the form" do
    expect(result["model"]).to be_a Post
  end
end
