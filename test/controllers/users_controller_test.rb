require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:one)
    @otheruser = users(:two)
  end
  
  test "should redirect index when not logged in" do
    get users_url
    assert_redirected_to login_url
  end
    
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get create" do
    get users_url
    #assert_response :success
    assert_redirected_to login_url
  end


# requires class UsersController < ApplicationController
#  before_action :logged_in_user, only: [:edit, :update]
#  to be built in
#
#  test "should redirect edit when not logged in" do
#    get edit_user_path(@user)
#    assert_not flash.empty?
#    assert_redirected_to login_url
#  end
#  test "should get edit" do
    #log_in_as(@user)
#    get edit_user_url, id: @user
#    assert_response :success
    #this will issue an error because not logged in!
    #assert_redirected_to login_url
#  end
  

end
