require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    #page for new session and create a new session both in login path
    get login_path
    assert_response :success
  end

end
