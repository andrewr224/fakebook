# frozen_string_literal: true

require "rails_helper"

feature "User Edit" do
  let(:user)         { create(:user, :with_profile) }
  let(:current_user) { user }
  let(:about_me)     { Faker::MostInterestingManInTheWorld.quote.to(35) }

  before do
    login current_user

    visit edit_user_path user
  end

  def edit_profile
    within "#edit_user" do
      fill_in :profile_about_me, with: about_me

      click_on "Update"
    end
  end

  scenario "edits user profile" do
    edit_profile

    expect(page).to have_content("Your profile has been successfully updated.")
  end

  context "when user is not a page owner" do
    let(:current_user) { create(:user, :with_profile) }

    scenario "shows authorization error" do
      expect(page).to have_content("You are not allowed to do that.")
    end
  end
end
