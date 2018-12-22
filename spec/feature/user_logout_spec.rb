# frozen_string_literal: true

require "rails_helper"

feature "User Logout" do
  let(:user) { create(:user, :with_profile) }

  before do
    login user

    within ".top-bar-right" do
      click_on "Log Out"
    end
  end

  scenario "shows logout notice" do
    expect(page).to have_content("Farewell!")
  end
end
