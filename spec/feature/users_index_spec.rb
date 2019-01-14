# frozen_string_literal: true

require "rails_helper"

feature "Users Index" do
  let(:current_user)    { create(:user, :with_profile) }
  let!(:user)           { create(:user, :with_profile) }
  let(:profile)         { user.profile }
  let(:current_profile) { current_user.profile }

  before do
    login current_user

    visit users_path
  end

  scenario "shows a list of all users" do
    within(".users") do
      expect(page).to have_content(profile.first_name)
    end
  end

  scenario "doesn't show current user" do
    within(".users") do
      expect(page).not_to have_content(current_profile.first_name)
    end
  end
end
