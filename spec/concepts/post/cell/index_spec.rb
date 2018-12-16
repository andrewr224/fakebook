# frozen_string_literal: true

require "rails_helper"

describe Post::Cell::Index do
  describe "#new_post" do
    subject(:new_post) { described_class.().new_post }

    it "returns a new post" do
      expect(new_post).to be_new_record
    end
  end
end
