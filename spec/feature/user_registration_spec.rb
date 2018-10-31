# frozen_string_literal: true

require 'rails_helper'

feature 'User Registration' do
  let(:email)    { Faker::Internet.email }
  let(:password) { '1234' }

  before { visit new_user_path }

  def fill_in_registration_form
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password

    click_on 'Sign Up'
  end

  it 'greets new user' do
    fill_in_registration_form

    expect(page).to have_content('Greetings, new user!')
  end

  context 'with invalid params' do
    let(:password) { '12' }

    it 'shows registration errors' do
      fill_in_registration_form

      expect(page).to have_content('There are errors preventing you to sign up')
    end
  end
end
