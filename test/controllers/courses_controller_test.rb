require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @profile = profiles(:one)
  end
  
  test "should get show" do
    log_in_as(users(:one))
    get profile_url(@profile)
    assert_response :success
    
    get course_url("current_profile_id" => 1)
    assert_response :success
  end
end
