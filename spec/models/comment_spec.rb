require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "not valid without a comment" do
    user = create(:user)
    thought = Thought.new(idea: "This is my idea.", user: user)
    comment = Comment.new(comment: nil, thought: thought, user: user)
    expect(comment).to_not be_valid
  end

  it "not valid without a thought" do
    user = create(:user)
    comment = Comment.new(comment: nil, user: user)
    expect(comment).to_not be_valid
  end

  it "not valid without a user" do
    user = create(:user)
    thought = Thought.new(idea: "This is my idea.", user: user)
    comment = Comment.new(comment: nil, thought: thought)
    expect(comment).to_not be_valid
  end

  it "valid comment" do
    user = create(:user)
    thought = Thought.new(idea: "This is my idea.", user: user)
    comment = Comment.new(comment: "This is my comment", thought: thought, user: user)
    expect(comment).to be_valid
  end
end
