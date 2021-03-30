require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "test validate email user" do
    user = User.new(email: "test")
    assert_not user.valid?
  end

  test "test user not save" do
    user = User.new(email: "test@test")
    assert_not user.save
  end

  test "test user save" do
    user = User.new(email: "test@email", password: "password")
    assert user.save
  end

end
