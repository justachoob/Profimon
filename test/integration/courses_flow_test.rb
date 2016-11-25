require 'test_helper'

class CoursesFlowTest < ActionDispatch::IntegrationTest
  #user login and flow tests
  setup do
    @user = users(:one)
    @profile = profiles(:one)
  end
  
  test "should get courses taken flow" do
    log_in_as(users(:one))
    get profile_url(@profile)
    assert_response :success
    
    get course_url( "current_profile_id" => 1)
    assert_response :success
    
    assert_select "p", "All courses taken are:"
  end
  
  test "should load into battle of CMPT 102" do
    log_in_as(users(:one))
    #get profile_url(@profile)
    get classes_select_url, params: { "profile"=>"1" }
    assert_response :success
    post enroll_url, params: { "subject"=>{"subject_id"=>"CMPT"}, "course_number"=>"102", "profile"=>{"id"=>"1"}, "commit"=>"Enroll"}
    
    assert_response :redirect
    get class_battles_load_url, params:  {"course_number"=>"102", "current_profile_id"=>"1", "subject"=>"CMPT"}
    assert_response :success
    
    #check if you are currently on battle page
    assert_select "h1", "CMPT 102 in session!"
  end
  
  test "should load javascript" do
    log_in_as(users(:one))
    #get profile_url(@profile)
    get classes_select_url, params: { "profile"=>"1" }
    assert_response :success
    post enroll_url, params: { "subject"=>{"subject_id"=>"CMPT"}, "course_number"=>"102", "profile"=>{"id"=>"1"}, "commit"=>"Enroll"}
    
    assert_response :redirect
    get class_battles_load_url, params:  {"course_number"=>"102", "current_profile_id"=>"1", "subject"=>"CMPT"}
    assert_response :success
    
    #check if you are currently on battle page
    assert_select "h1", "CMPT 102 in session!"
    assert_select "p", "Instructor: Ali Madooei"
  end
  
  
end
