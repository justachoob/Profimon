require 'test_helper'

class ClassBattlesControllerTest < ActionDispatch::IntegrationTest
  test "should get load" do
    get class_battles_load_url
    assert_response :success
  end

end
