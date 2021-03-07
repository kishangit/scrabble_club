require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
                      first_name: 'John', last_name: "Doe", 
                      email: "test@gmail.com", phone: '1234567890', password: 'password'
                      )
  end

  test "User should be valid" do
    assert @user.valid?
  end

  test "First name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  test "Last name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  test "Email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "Phone should be present" do
    @user.phone = ""
    assert_not @user.valid?
  end
end
