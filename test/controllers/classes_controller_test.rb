require 'test_helper'

class ClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get classes_select_url
    assert_response :success
  end

end
