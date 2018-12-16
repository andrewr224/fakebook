# frozen_string_literal: true

require "rails_helper"

describe Fakebook::Cell::TopBar do
  describe "#signed_in?" do
    subject(:signed_in?) do
      described_class.(nil, current_user: current_user).signed_in?
    end

    context "with current_user" do
      let(:current_user) { create(:user) }

      it "returns true" do
        expect(signed_in?).to be true
      end
    end

    context "with no user" do
      let(:current_user) {}

      it "returns true" do
        expect(signed_in?).to be false
      end
    end
  end

  describe "#user_email" do
    subject(:user_email) do
      described_class.(nil, current_user: current_user).user_email
    end

    context "with current_user" do
      let(:current_user) { create(:user) }

      it "returns true" do
        expect(user_email).to eq current_user.email
      end
    end

    context "with no user" do
      let(:current_user) {}

      it "returns true" do
        expect(user_email).to be_nil
      end
    end
  end

  describe "#sessions_controller?" do
    subject(:sessions_controller?) do
      described_class
        .(nil, controller_name: controller_name)
        .sessions_controller?
    end

    context "when controller name is 'user_sessions'" do
      let(:controller_name) { "user_sessions" }

      it "returns true" do
        expect(sessions_controller?).to be true
      end
    end

    context "when controller name is not 'user_sessions'" do
      let(:controller_name) { "application_controller" }

      it "returns true" do
        expect(sessions_controller?).to be false
      end
    end
  end
end
