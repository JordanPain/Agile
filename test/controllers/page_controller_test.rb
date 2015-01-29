require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get browse" do
    get :browse
    assert_response :success
  end

  test "should get match" do
    get :match
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get support" do
    get :support
    assert_response :success
  end

  test "should get contact_us" do
    get :contact_us
    assert_response :success
  end

end
