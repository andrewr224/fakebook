# frozen_string_literal: true

require "rails_helper"

describe User::Delete do
  subject(:result) { described_class.(params) }

  let(:params)       { { id: user.id, current_user: current_user } }
  let!(:current_user) { create(:user) }

  context "when it's the same user" do
    let!(:user) { current_user }

    it "deletes the user" do
      expect { result }.to change(User, :count).by(-1)
    end
  end

  context "when it's a different user" do
    let!(:user) { create(:user) }

    it "doesn't delete the user" do
      expect { result }.not_to change(User, :count)
    end
  end
end
