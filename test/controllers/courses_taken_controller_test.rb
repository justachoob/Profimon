require 'test_helper'

class CoursesTakenControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get courses_taken_show_url
    assert_response :success
  end

end
