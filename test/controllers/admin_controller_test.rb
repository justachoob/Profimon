require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:one)
  end
  
  test "should show user" do
    log_in_as(@user)
    get users_url
    assert_response :success
  end
  
  test "should as for login instead of show user" do
    #log_in_as(@user)
    get users_url
    assert_redirected_to login_url
  end
    
    
end
