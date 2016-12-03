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
  
  
  #GET "/badges/7?current_profile_id=7"
  #Parameters: {"current_profile_id"=>"7", "id"=>"7"}
  #rendered show
  #Completed 200
  
  
  
end
