require 'test_helper'

class CoursesFlowTest < ActionDispatch::IntegrationTest
  #user login and flow tests
  setup do
    @user = users(:one)
    @profile = profiles(:one)
  end
  
end
