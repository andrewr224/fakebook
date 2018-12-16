# frozen_string_literal: true

module TestHelpers
  module Features
    def login(user, password: random_password)
      user.update_attributes password: password

      visit root_path

      fill_in :email,    with: user.email
      fill_in :password, with: password

      click_button "Log In"
    end

    private

    def random_password
      (1..9).to_a.sample(4).join
    end
  end
end
