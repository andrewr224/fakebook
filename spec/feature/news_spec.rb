# frozen_string_literal: true

require "rails_helper"

feature "News Feed" do
  let(:user) { create(:user, :with_profile) }

  context "when there are posts" do
    let(:target_post) { create(:post) }

    before do
      target_post

      create_list(:post, rand(1..3))

      login user

      visit posts_path
    end

    scenario "shows all posts" do
      expect(page).to have_content(target_post.body)
    end
  end

  context "when there are no posts" do
    before do
      login user

      visit posts_path
    end

    scenario "shows 'Nothing here' message" do
      expect(page).to have_content("Nothing here yet")
    end
  end
end
