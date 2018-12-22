# frozen_string_literal: true

require "rails_helper"

feature "User Registration" do
  let(:email)      { Faker::Internet.email }
  let(:password)   { Faker::Internet.password(4, 5) }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name)  { Faker::Name.last_name }
  let(:birthday)   { Faker::Date.between(60.years.ago, 18.years.ago) }
  let(:sex)        { %i[profile_sex_male profile_sex_female].sample }

  before do
    visit root_path

    within "#registration" do
      fill_in :profile_first_name, with: first_name
      fill_in :profile_last_name,  with: last_name
      fill_in :user_email,         with: email
      fill_in :user_password,      with: password
      fill_in :profile_birthday,   with: birthday
      choose sex

      click_on "Sign Up"
    end
  end

  scenario "greets new user" do
    expect(page).to have_content("Greetings, #{first_name}!")
  end

  context "with invalid params" do
    let(:password) { Faker::Internet.password(1, 2) }

    scenario "shows registration errors" do
      expect(page).to have_content("There are errors preventing you to sign up")
    end
  end
end
