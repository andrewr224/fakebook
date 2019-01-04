# frozen_string_literal: true

require "rails_helper"

describe User::Cell::Show do
  describe "#new_post" do
    subject(:new_post) { described_class.().new_post }

    it "returns a new post" do
      expect(new_post).to be_new_record
    end
  end

  describe "#user_posts" do
    subject(:user_posts) { described_class.(user).user_posts }

    let(:user)  { create(:user, :with_profile) }
    let(:count) { rand(1..3) }

    before { create_list(:post, count, user: user) }

    it "returns a new post" do
      expect(user_posts.length).to eq count
    end
  end
end
