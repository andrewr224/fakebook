# frozen_string_literal: true

require "rails_helper"

describe User::Update do
  subject(:result) { described_class.(params) }

  let(:model)          { create(:user, :with_profile) }
  let(:current_user)   { model }
  let(:profile)        { model.profile }
  let(:profile_params) { attributes_for(:profile) }

  let(:params) do
    { profile: profile_params, id: model.id }.merge(additional_params)
  end

  let(:additional_params) { { "current_user" => current_user } }

  it "is successful" do
    expect(result).to be_success
  end

  it "returns a user" do
    expect(result["model"]).to be_a User
  end

  it "updates user profile" do
    expect { result && profile.reload }.to change(profile, :first_name)
  end

  context "with invalid params" do
    let(:profile_params) { attributes_for(:profile).merge(first_name: nil) }

    it "is a failure" do
      expect(result).to be_failure
    end

    it "returns a user" do
      expect(result["model"]).to be_a User
    end

    it "doesn't update user profile" do
      expect { result && profile.reload }.not_to change(profile, :first_name)
    end
  end

  context "when user is not the profile owner" do
    let(:current_user) { create(:user) }

    it "is a failure" do
      expect(result).to be_failure
    end

    it "returns policy breach" do
      expect(result["result.policy.default"]).to be_failure
    end

    it "doesn't update user profile" do
      expect { result && profile.reload }.not_to change(profile, :first_name)
    end
  end
end
