require 'rails_helper'

RSpec.describe Like, type: :model do
  it "not valid without a thought" do
    like = Like.new(thought: nil)
    expect(like).to_not be_valid
  end

  it "not valid without a user" do
    thought = create(:thought)
    like = Like.new(thought: thought, user: nil)
    expect(like).to_not be_valid
  end

  it "valid like" do
    thought = create(:thought)
    user = create(:user)
    like = Like.new(thought: thought, user: user)
    expect(like).to be_valid
  end

end
