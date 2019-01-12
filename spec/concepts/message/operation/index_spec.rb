# frozen_string_literal: true

require "rails_helper"

describe Message::Index do
  subject(:result) { described_class.(params) }

  let(:current_user) { create(:user) }
  let(:user)         { create(:user) }

  let(:params) do
    {
      current_user: current_user,
      user_id:      user.id
    }
  end

  context "when there is a dialogue between users" do
    before { create(:dialogue, :with_messages, users: [user, current_user]) }

    it "doesn't create a new dialogue" do
      expect { result }.not_to change(Dialogue, :count)
    end

    it "returns a dialogue" do
      expect(result["model"]).to be_a Dialogue
    end
  end

  context "when there is no dialogue between users" do
    it "creates a new dialogue" do
      expect { result }.to change(Dialogue, :count).by(1)
    end

    it "returns a dialogue" do
      expect(result["model"]).to be_a Dialogue
    end
  end

  context "when there is no user" do
    let(:params) { { current_user: current_user } }

    context "when current user has other dialogues" do
      let!(:current_user) { create(:user, :with_dialogue) }
      let(:dialogue)      { current_user.dialogues.first }

      it "doesn't create a new dialogue" do
        expect { result }.not_to change(Dialogue, :count)
      end

      it "returns an existing dialogue" do
        expect(result["model"]).to eq dialogue
      end
    end

    context "when current user has no other dialogues" do
      it "doesn't create a new dialogue" do
        expect { result }.not_to change(Dialogue, :count)
      end

      it "returns nil" do
        expect(result["model"]).to be nil
      end
    end
  end
end
