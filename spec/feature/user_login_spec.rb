# frozen_string_literal: true

require "rails_helper"

feature "User Login" do
  let(:user)     { create(:user, :with_profile) }
  let(:profile)  { user.profile }
  let(:email)    { user.email }
  let(:password) { Faker::Internet.password(4, 5) }

  context "with valid credentials" do
    before do
      user.update_attributes password: password

      visit root_path

      fill_in :email,    with: email
      fill_in :password, with: password

      click_on "Log In"
    end

    scenario "logs user in" do
      expect(page).to have_content("Welcome back, #{profile.first_name}!")
    end
  end

  context "with invalid credentials" do
    let(:password) { Faker::Internet.password(1, 2) }

    before do
      visit root_path

      fill_in :email,    with: email
      fill_in :password, with: password

      click_on "Log In"
    end

    scenario "shows registration errors" do
      expect(page).to have_content("Login failed")
    end
  end
end
