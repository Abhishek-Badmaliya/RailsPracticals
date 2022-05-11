require "test_helper"
require "nuser"

class NuserTest < ActiveSupport::TestCase
  test "Email Id must be exist" do
    assert_not Nuser.new(password: "password").save
  end

  test "Password must be exist" do
    assert_not Nuser.new(email: "abx@gmail.com").save
  end
end
