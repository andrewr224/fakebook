# frozen_string_literal: true

require "rails_helper"

feature "Create Post" do
  let(:user) { create(:user, :with_profile) }
  let(:post) { Faker::MostInterestingManInTheWorld.quote }

  before do
    login user

    visit new_post_path

    within "#new_post" do
      fill_in :post_body, with: post

      click_on "Create Post"
    end
  end

  scenario "creates a new post" do
    expect(page).to have_content("Your Post has been created!")
  end

  context "with invalid params" do
    let(:post) {}

    scenario "shows creation error" do
      expect(page).to have_content("Your post was not created")
    end
  end
end
