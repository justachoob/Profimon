require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
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
end
