# frozen_string_literal: true

require "rails_helper"

describe Message::Create do
  subject(:result) { described_class.(params) }

  let(:params)            { controller_params.merge(additional_params) }
  let(:controller_params) { { message: message_params } }
  let(:additional_params) { { "current_user" => current_user } }
  let(:current_user)      { create(:user, :with_dialogue) }
  let(:dialogue)          { current_user.dialogues.first }

  let(:message_params) do
    attributes_for(:message).merge(dialogue_id: dialogue.id)
  end

  context "with valid params" do
    it "is successful" do
      expect(result).to be_success
    end

    it "creates a new message" do
      expect { result } .to change(Message, :count).by(1)
    end

    it "returns a message model" do
      expect(result["model"]).to be_a Message
    end
  end

  context "with invalid params" do
    context "with no text" do
      let(:message_params) do
        attributes_for(:message).merge(dialogue_id: dialogue.id, text: nil)
      end

      it "is a failure" do
        expect(result).to be_failure
      end

      it "doesn't create a new message" do
        expect { result } .not_to change(Message, :count)
      end

      it "returns a post model" do
        expect(result["model"]).to be_a Message
      end
    end

    context "without a user" do
      let(:current_user) { nil }
      let(:dialogue)     { create(:dialogue) }

      it "is a failure" do
        expect(result).to be_failure
      end

      it "doesn't create a new message" do
        expect { result } .not_to change(Message, :count)
      end
    end

    context "without a dialogue" do
      let(:message_params) { attributes_for(:message) }

      it "is a failure" do
        expect(result).to be_failure
      end

      it "doesn't create a new message" do
        expect { result } .not_to change(Message, :count)
      end
    end

    context "when user is not a participant in the dialogue" do
      let(:dialogue) { create(:dialogue) }

      it "is a failure" do
        expect(result).to be_failure
      end

      it "doesn't create a new message" do
        expect { result } .not_to change(Message, :count)
      end
    end
  end
end
