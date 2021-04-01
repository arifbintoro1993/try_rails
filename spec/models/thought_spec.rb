require 'rails_helper'

RSpec.describe Thought, type: :model do
  it "not valid without an idea" do
    thought = Thought.new(idea: nil)
    expect(thought).to_not be_valid
  end

  it "not valid without a user" do
    thought = Thought.new(idea: "This is my idea.")
    expect(thought).to_not be_valid
  end

  it "valid thought" do
    user = create(:user)
    thought = Thought.new(idea: "This is my idea.", user: user)
    expect(thought).to be_valid
  end
end
