# frozen_string_literal: true

require 'rails_helper'

feature 'User Registration' do
  let(:email)    { Faker::Internet.email }
  let(:password) { Faker::Internet.password(4, 5) }

  before do
    visit new_user_path

    fill_in :user_email,                 with: email
    fill_in :user_password,              with: password
    fill_in :user_password_confirmation, with: password

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
