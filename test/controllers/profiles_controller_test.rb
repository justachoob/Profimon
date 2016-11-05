require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    #gives error no route matches show, profile missing keys id
    get profile_url, id: @profile
    #get :show, id: @post
    #get profile_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    #failure got 302 redirect to login
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      #failure expected 3, actual 2
      post profiles_url, params: { profile: { badges: @profile.badges, courses_taken: @profile.courses_taken, current_gpa: @profile.current_gpa, faculty: @profile.faculty, num_of_courses_taken: @profile.num_of_courses_taken, pname: @profile.pname } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    # failure got 302 redirect to login
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    #Failure creates a 302 error, redirect to /login
    assert_response :success
  end

  test "should update profile" do
    #failure was redirected to login
    patch profile_url(@profile), params: { profile: { badges: @profile.badges, courses_taken: @profile.courses_taken, current_gpa: @profile.current_gpa, faculty: @profile.faculty, num_of_courses_taken: @profile.num_of_courses_taken, pname: @profile.pname } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    #failure didnt change by -1
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
