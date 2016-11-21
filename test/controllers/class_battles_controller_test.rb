require 'test_helper'

class ClassBattlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @profile = profiles(:one)
  end
  
  test "should post enroll" do
    log_in_as(users(:one))
    #get profile_url(@profile)
    get classes_select_url, params: { "profile"=>"1" }
    assert_response :success
    post enroll_url, params: { "subject"=>{"subject_id"=>"CMPT"}, "course_number"=>"102", "profile"=>{"id"=>"1"}, "commit"=>"Enroll"}
    
    assert_response :redirect
    
    #get class_battles_load_url,  {"course_number"=>"102", "current_profile_id"=>"1", "subject"=>"CMPT"}
    #assert_response :success
  end
  
  
  test "should get load" do
    log_in_as(users(:one))
    #get profile_url(@profile)
    get classes_select_url, params: { "profile"=>"1" }
    assert_response :success
    post enroll_url, params: { "subject"=>{"subject_id"=>"CMPT"}, "course_number"=>"102", "profile"=>{"id"=>"1"}, "commit"=>"Enroll"}
    
    assert_response :redirect
    get class_battles_load_url, params:  {"course_number"=>"102", "current_profile_id"=>"1", "subject"=>"CMPT"}
    assert_response :success
  end

end
