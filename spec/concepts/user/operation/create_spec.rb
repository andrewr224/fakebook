# frozen_string_literal: true

require 'rails_helper'

describe User::Create do
  subject(:result) { described_class.(params) }

  let(:params)         { { user: user_params.merge(profile_params) } }
  let(:user_params)    { attributes_for(:user) }
  let(:profile_params) { { profile: attributes_for(:profile) } }

  it 'is successful' do
    expect(result).to be_success
  end

  it 'creates a new user' do
    expect { result } .to change(User, :count).by(1)
  end

  it 'creates a new profile' do
    expect { result } .to change(Profile, :count).by(1)
  end

  it 'returns a user' do
    expect(result['model']).to be_a User
  end

  context 'with invalid params' do
    let(:user_params) { attributes_for(:user).merge(email: nil) }

    it 'is a failure' do
      expect(result).to be_failure
    end

    it "doesn't create a new user" do
      expect { result } .not_to change(User, :count)
    end

    it "doesn't create a new profile" do
      expect { result } .not_to change(Profile, :count)
    end

    it 'returns a user' do
      expect(result['model']).to be_a User
    end

    context 'without profile attributes' do
      let(:user_params)    { attributes_for(:user) }
      let(:profile_params) { { profile: {} } }

      it 'is a failure' do
        expect(result).to be_failure
      end

      it "doesn't create a new user" do
        expect { result } .not_to change(User, :count)
      end

      it "doesn't create a new profile" do
        expect { result } .not_to change(Profile, :count)
      end

      it 'returns a user' do
        expect(result['model']).to be_a User
      end
    end
  end
end
