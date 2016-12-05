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
    
    #flow update check if you user page
    assert_response :redirect
    get "/users/3"
    
    #check if on new user page by selecting h1 element
    assert_response :success
    assert_select "h1", "Welcome, abcdefg!"
  end
  
  test "should not allow fake email when creating user" do
    get new_user_url
    assert_response :success
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: "abcdefg", email: "not an email", password: "password1", password_confirmation: "password1", id: 3, admin: false} } 
    end
    
    #does error occur?
    assert_select "p", "The following errors occurred:"
    assert_response :success
  end
  
  test "should not allow user creation when passwords not matching when creating user" do
    get new_user_url
    assert_response :success
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: "abcdefg", email: "example@example.com", password: "passw", password_confirmation: "password1", id: 3, admin: false} } 
    end
    
    #does error occur?
    assert_select "p", "The following errors occurred:"
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
  
  test "should reach about page" do
    log_in_as(users(:one))
    get "/about"
    assert_response :success
    
    assert_select "h2", "Your Mission"
    assert_select "h3", "Credits"
  end
  
  test "should have modal button" do
    log_in_as(users(:one))
    get "/users/1"
    assert_response :success
    
    assert_select "button", "?"
    assert_select "h2", "Welcome to your profile page!"
    
  end
  
  test "should have modal button on classes selection page" do
    log_in_as(users(:one))
    get "/users/1"
    assert_response :success
    
    get "/classes/select?profile=1"
    assert_response :success
    
    assert_select "button", "?"
    assert_select "h2", "Select a course for your character!"
    
  end
  
  test "should have modal button on classes battle page" do
    log_in_as(users(:one))
    get "/users/1"
    assert_response :success

    get classes_select_url, params: { "profile"=>"1" }
    assert_response :success
    post enroll_url, params: { "subject"=>{"subject_id"=>"CMPT"}, "course_number"=>"102", "profile"=>{"id"=>"1"}, "commit"=>"Enroll"}
    
    assert_response :redirect
    get class_battles_load_url, params:  {"course_number"=>"102", "current_profile_id"=>"1", "subject"=>"CMPT"}
    assert_response :success
    
    assert_select "button", "?"
    assert_select "h2", "Class has started! It's you against the Profimon!"
    
  end
    
  test "should show badges page content" do
    log_in_as(users(:one))
    get "/users/1"
    assert_response :success
    
    get "/profiles/1"
    assert_response :success
    
    get "/badges/1?current_profile_id=1", params: { current_profile_id: 1, id: 1}
    assert_response :success
    
    assert_select "h1", "testuser1's Badges"
  end
end
