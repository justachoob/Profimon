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
    
    get courses_taken_index_url
    assert_response :success
    
    assert_select "p", "All courses taken are:"
  end
  
  
  
end
