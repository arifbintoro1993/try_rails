require 'rails_helper'

RSpec.describe User, type: :model do
    it "not valid email" do
        user = User.new(email: "test")
        expect(user).to_not be_valid
    end

    it "not valid user without password" do
        user = User.new(email: "test@test")
        expect(user).to_not be_valid
    end

    it "valid user" do
        user = User.new(email: "test@test", password: "test")
        expect(user).to be_valid
    end
end