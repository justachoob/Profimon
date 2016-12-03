require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @profile = profiles(:one)
    
  end
  
  test "valid profile name" do
  	profile = Profile.new
  	profile.pname = ""
  	profile.faculty = "Applied Sciences"
  	assert_not profile.valid?
  end
  
  test "valid faculty name" do
  	profile = Profile.new
  	profile.pname = "test profile"
  	profile.faculty = ""
  	assert_not profile.valid?
  end
  
  test "valid picture " do
  	profile = Profile.new
  	profile.pname = "test profile"
  	profile.faculty = "faculty"
  	profile.avatar = ""
  	assert_not profile.valid?
  
  end
  
  test "valid badge associated to profile" do
    profile = Profile.reflect_on_association(:badges)
    profile.macro == :has_many
    assert profile.validate?
  end
    
  test "valid course associated to profile" do
    profile = Profile.reflect_on_association(:courses)
    profile.macro == :has_many
    assert profile.validate?
  end
end
