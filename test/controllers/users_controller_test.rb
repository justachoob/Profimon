require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get create" do
    get users_url
    assert_response :success
    #assert_redirected_to page_url(title: 'login')
  end
  
#  test "should get edit" do
#    get edit_user_url
#    assert_response :success
#  end
  

end
