require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
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

  test "should redirect instead of get new when not logged in" do
    get new_profile_url
    #failure got 302 redirect to login
    #assert_response :success
    assert_redirected_to login_url
  end
  
  test "should get new" do
    log_in_as(users(:one))
    get new_profile_url
    assert_response :success
  end


  test "should redirect instead of show profile when not logged in" do
    get profile_url(@profile)
    # failure got 302 redirect to login
    #assert_response :success
    assert_redirected_to login_url
  end
  
  test "should show profile" do
    log_in_as(users(:one))
    get profile_url(@profile)
    assert_response :success
  end

  test "should redirect instead of get edit when not logged in" do
    get edit_profile_url(@profile)
    #Failure creates a 302 error, redirect to /login
    #assert_response :success
    assert_redirected_to login_url
  end
  
  test "should get edit" do
    log_in_as(users(:one))
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should redirect instead of update profile when not logged in" do
    #failure was redirected to login
    patch profile_url(@profile), params: { profile: { badges: @profile.badges, courses_taken: @profile.courses_taken, current_gpa: @profile.current_gpa, faculty: @profile.faculty, num_of_courses_taken: @profile.num_of_courses_taken, pname: @profile.pname } }
    #assert_redirected_to profile_url(@profile)
    assert_redirected_to login_url
  end

  test "destroy profile should require logged in user" do
    #failure didnt change by -1
    assert_no_difference('Profile.count') do
      delete profile_path(profiles(:one))
    end
      
    assert_redirected_to login_url
  end

  test "create should require logged-in user" do
    assert_no_difference('Profile.count') do
      post profiles_path
    end
    assert_redirected_to login_url
  end
  

  test "should create profile" do
    assert_difference('Profile.count') do
      log_in_as(users(:one))
      #failure expected 3, actual 2
      post profiles_path, params: { profile: { pname: "MeowMeow", faculty: "Beedie", num_of_courses_taken: 0} }
      #post profiles_path, params: { profile: { badges: @profile.badges, courses_taken: @profile.courses_taken, current_gpa: @profile.current_gpa, faculty: @profile.faculty, num_of_courses_taken: @profile.num_of_courses_taken, pname: @profile.pname } }
    end
        
    assert_redirected_to profile_url(Profile.last)
  end

  test "should destroy profile" do
    #failure didnt change by -1 because not logged in
    assert_difference('Profile.count', -1) do
      log_in_as(users(:one))
      delete profile_path(profiles(:one))
    end
      
    assert_redirected_to profiles_url
  end
end
