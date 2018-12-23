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

      it "returns false" do
        expect(signed_in?).to be false
      end
    end
  end

  describe "#signed_in?" do
    subject(:current_user) do
      described_class.(nil, current_user: user).current_user
    end

    context "with current_user" do
      let(:user) { create(:user) }

      it "returns current_user" do
        expect(current_user).to eq current_user
      end
    end

    context "with no user" do
      let(:user) {}

      it "returns nil" do
        expect(current_user).to be nil
      end
    end
  end

  describe "#user_name" do
    subject(:user_name) do
      described_class.(nil, current_user: current_user).user_name
    end

    context "with current_user" do
      let(:current_user) { create(:user, :with_profile) }
      let(:profile)      { current_user.profile }

      it "returns true" do
        expect(user_name).to match profile.first_name
      end
    end

    context "with no user" do
      let(:current_user) {}

      it "returns true" do
        expect(user_name).to be_nil
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
