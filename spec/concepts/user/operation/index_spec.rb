# frozen_string_literal: true

require "rails_helper"

describe User::Index do
  subject(:result) { described_class.(params) }

  let(:params)       { { "current_user" => current_user } }
  let(:current_user) { create(:user) }
  let(:user_count)   { rand(1..3) }

  it "is successful" do
    expect(result).to be_success
  end

  context "when there are many users" do
    before { create_list(:user, user_count) }

    it "returns all users" do
      expect(result["model"].length).to eq(user_count)
    end
  end

  context "when there is only current user" do
    it "returns all users" do
      expect(result["model"]).to be_empty
    end
  end
end
