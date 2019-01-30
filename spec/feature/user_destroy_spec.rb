# frozen_string_literal: true

require "rails_helper"

feature "User Destroy" do
  let(:user)         { create(:user, :with_profile) }
  let(:current_user) { user }

  let(:farewell_message) do
    "Your profile has been deleted. Farewell, my dear!"
  end

  before do
    login current_user

    visit edit_user_path user
  end

  scenario "deletes user profile" do
    click_on "Delete Profile"

    expect(page).to have_content(farewell_message)
  end
end
