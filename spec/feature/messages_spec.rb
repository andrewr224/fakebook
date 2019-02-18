# frozen_string_literal: true

require "rails_helper"

feature "Messages" do
  let(:user)         { create(:user, :with_profile) }
  let(:current_user) { create(:user, :with_profile) }
  let(:dialogue)     { create(:dialogue, users: [user, current_user]) }
  let!(:message)     { create(:message, user: user, dialogue: dialogue) }
  let(:new_message)  { Faker::HitchhikersGuideToTheGalaxy.quote.to(35).strip }

  before do
    login current_user

    visit user_messages_path(user)
  end

  def send_message
    within("#new_message") do
      fill_in "message_text", with: new_message
    end

    click_on "Send Message"
  end

  scenario "shows received messages" do
    expect(page).to have_content message.text
  end

  scenario "writes new messages" do
    send_message

    within(".messages") do
      expect(page).to have_content new_message
    end
  end
end
