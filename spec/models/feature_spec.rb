require "rails_helper"

describe Feature do
  let(:user) { create :user }

  subject { build :feature }

  context "when loggable is not a BackendApp" do
    before { subject.loggable = user }

    it "should not be valid" do
      expect(subject.valid?).to be false
    end
  end
end
