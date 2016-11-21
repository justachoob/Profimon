require 'test_helper'

class CoursesTakenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @profile = profiles(:one)
  end
  
  test "should get show" do
    log_in_as(users(:one))
    get profile_url(@profile)
    assert_response :success
    
    get courses_taken_index_url
    assert_response :success
  end

end
