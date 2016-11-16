require 'test_helper'

class ProfimonSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @profile = profiles(:one)
    @skill = skills(:one)
  end
  
  test "should get index" do
    log_in_as(users(:one))
    #gives error no route matches show, profile missing keys id
    #get profile_url(@profile)
    #get :show, id: @post
    #get profile_url
    #assert_response :success
    
    get skills_url(@skill)
    
    assert_response :success
  end
end
