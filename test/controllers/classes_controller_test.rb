require 'test_helper'

class ClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @profile = profiles(:one)
  end
  
  test "should get select" do
    log_in_as(users(:one))
    #get profile_url(@profile)
    #profilescontroller#show as HTML
    #Parameters: {"id=>"1"}
    # GET "/classes/select?profile=1"
    #Parameters: {"profile"=>"1"}
    get classes_select_url, params: { "profile"=>"1" }
    assert_response :success
  end

end
