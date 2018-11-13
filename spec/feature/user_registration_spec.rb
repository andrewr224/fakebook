# frozen_string_literal: true

require 'rails_helper'

feature 'User Registration' do
  let(:email)      { Faker::Internet.email }
  let(:password)   { Faker::Internet.password(4, 5) }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name)  { Faker::Name.last_name }
  let(:sex)        { %i[user_sex_male user_sex_female].sample }

  before do
    visit new_user_path

    within '#registration' do
      fill_in :user_first_name, with: first_name
      fill_in :user_last_name,  with: last_name
      fill_in :user_email,      with: email
      fill_in :user_password,   with: password
      choose sex
    end

    click_on 'Sign Up'
  end

  it 'greets new user' do
    expect(page).to have_content('Greetings, new user!')
  end

  context 'with invalid params' do
    let(:password) { Faker::Internet.password(1, 2) }

    it 'shows registration errors' do
      expect(page).to have_content('There are errors preventing you to sign up')
    end
  end
end
