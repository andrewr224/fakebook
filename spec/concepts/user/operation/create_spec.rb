# frozen_string_literal: true

require 'rails_helper'

describe User::Create do
  subject(:result) { described_class.(params) }

  let(:params) { { user: attributes_for(:user) } }

  it 'is successful' do
    expect(result).to be_success
  end

  it 'creates a new user' do
    expect { result } .to change(User, :count).by(1)
  end

  it 'returns a user' do
    expect(result['model']).to be_a User
  end

  context 'with invalid params' do
    let(:params) { {} }

    it 'is a failure' do
      expect(result).to be_failure
    end

    it "doesn't create a new user" do
      expect { result } .not_to change(User, :count)
    end

    it 'returns a user' do
      expect(result['model']).to be_a User
    end
  end
end
