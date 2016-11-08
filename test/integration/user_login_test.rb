require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @profile = profiles(:one)
  end
  
  test "should get index" do
    log_in_as(users(:one))
    #gives error no route matches show, profile missing keys id
    get profile_url(@profile)
    #get :show, id: @post
    #get profile_url
    assert_response :success
  end
  
  test "should redirect instead of getting to user url when not logged in" do
    get users_url
    #failure got 302 redirect to login
    #assert_response :success
    assert_redirected_to login_url
  end
  
  #rest of the tests should be in profile controller
  test "should get new profile as long as user is logged in" do
    log_in_as(users(:one))
    get new_profile_url
    assert_response :success
  end
  
  test "should show profile when user is logged in" do
    log_in_as(users(:one))
    get profile_url(@profile)
    assert_response :success
  end
end
