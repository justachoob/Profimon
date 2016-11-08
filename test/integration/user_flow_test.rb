require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  #user login and flow tests
  setup do
    @user = users(:one)
    @profile = profiles(:one)
  end
    
  test "should get new for creating user" do
    get new_user_url
    assert_response :success
    assert_difference('User.count') do
      post users_url, params: { user: { name: "abcdefg", email: "example@example.com", password: "password1", password_confirmation: "password1", id: 3, admin: false} } 
    end
    
    assert_response :redirect
  end
  
  test "should not allow fake email when creating user" do
    get new_user_url
    assert_response :success
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: "abcdefg", email: "not an email", password: "password1", password_confirmation: "password1", id: 3, admin: false} } 
    end
    
    assert_response :success
  end
  
  test "should not allow user creation when passwords not matching when creating user" do
    get new_user_url
    assert_response :success
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: "abcdefg", email: "example@example.com", password: "passw", password_confirmation: "password1", id: 3, admin: false} } 
    end
    
    assert_response :success
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
