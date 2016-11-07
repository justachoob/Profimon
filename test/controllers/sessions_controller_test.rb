require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test "should get new" do
    #page for new session and create a new session both in login path
    get login_path
    assert_response :success
  end
  
  test "should sign in user with correct credentials" do
    user_to_log_in = users(:one)
    post login_url, params: { session: { name: "testuser1", password: "password1" } }, headers: {}
    assert_equal user_to_log_in.id, session[:user_id]
  end

end
