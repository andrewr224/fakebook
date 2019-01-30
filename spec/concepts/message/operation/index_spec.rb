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

    it "is success" do
      expect(result).to be_success
    end
  end

  context "when there is no dialogue between users" do
    it "creates a new dialogue" do
      expect { result }.to change(Dialogue, :count).by(1)
    end

    it "returns a dialogue" do
      expect(result["model"]).to be_a Dialogue
    end

    it "is success" do
      expect(result).to be_success
    end
  end

  context "with invalid params" do
    context "when there is no user" do
      let(:params) { { current_user: current_user } }

      it "doesn't create a new dialogue" do
        expect { result }.not_to change(Dialogue, :count)
      end

      it "is falsy" do
        expect(result).to be_failure
      end

      it "retuns nil" do
        expect(result["model"]).to be_nil
      end
    end

    context "when it's the same user" do
      let(:user) { current_user }

      it "doesn't create a new dialogue" do
        expect { result }.not_to change(Dialogue, :count)
      end

      it "is falsy" do
        expect(result).to be_failure
      end

      it "retuns nil" do
        expect(result["model"]).to be_nil
      end
    end
  end
end
