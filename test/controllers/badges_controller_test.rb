require 'test_helper'

class BadgesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
    @profile = profiles(:one)
    @badge = badges(:one)
  end
  
  
  test "should show badges" do
    log_in_as(users(:one))
    get "/badges/1?current_profile_id=1", params: { current_profile_id: 1, id: 1}
    assert_response :success
  end

  test "should delete badges" do
    log_in_as(users(:one))
    get "/badges/1?current_profile_id=1", params: { current_profile_id: 1, id: 1}
    assert_response :success
    assert_difference('Badge.count', -1) do
      
      delete badge_path(badges(:one))
    end
    assert_response :redirect
  end
  
  test "should create badges" do
    log_in_as(users(:one))
    assert_difference('Badge.count') do
      post badges_path, params: { current_profile_id: 1, id: 1, course: {profile_id: 1, subject: "CMPT" } }
    end
    assert_response :redirect
  end
  

  #someone needs to look into these!!
  test "create should require logged-in user for badges" do
    assert_no_difference('Badge.count') do
      post badges_path, params: { current_profile_id: 1, id: 1, course: {profile_id: 1, subject: "CMPT" } }
    end
    assert_redirected_to login_url
  end
  
  test "destroy badges should require logged in user" do
    #
    assert_no_difference('Badge.count') do
      delete badge_path(badges(:one))
    end
      
    assert_redirected_to login_url
  end
end
