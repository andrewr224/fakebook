# frozen_string_literal: true

require "rails_helper"

feature "User Show" do
  let(:user)         { create(:user, :with_profile) }
  let(:current_user) { user }
  let!(:post)        { create(:post, user: user) }
  let(:new_post)     { Faker::MostInterestingManInTheWorld.quote }

  before do
    login current_user

    visit user_path user
  end

  scenario "shows user posts" do
    expect(page).to have_content(post.body)
  end

  scenario "allows creating posts" do
    within "#new_post" do
      fill_in :post_body, with: new_post

      click_on "Create Post"
    end

    expect(page).to have_content("Your Post has been created!")
  end

  scenario "has 'Edit Profile' link" do
    expect(page).to have_link("Edit Profile", href: edit_user_path(user))
  end

  scenario "doesn't have message link" do
    expect(page).not_to have_link("Message", href: user_messages_path(user))
  end

  context "when user is not a page owner" do
    let(:current_user) { create(:user, :with_profile) }

    scenario "shows user posts" do
      expect(page).to have_content(post.body)
    end

    scenario "doesn't allow to create a post" do
      expect(page).not_to have_content("Create Post")
    end

    scenario "doesn't have 'Edit Profile' link" do
      expect(page).not_to have_link("Edit Profile", href: edit_user_path(user))
    end

    scenario "has message link" do
      expect(page).to have_link("Message", href: user_messages_path(user))
    end
  end
end
