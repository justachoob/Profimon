require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get create" do
    get users_url
    #assert_response :success
    assert_redirected_to login_url
  end
  
#  test "should get edit" do
#    get edit_user_url
#    assert_response :success
#    #this will issue an error because not logged in!
#  end
  

end
