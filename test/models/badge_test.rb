require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
    @profile = profiles(:one)
    
  end
  
  test "valid badge associated course" do
    badge = Badge.reflect_on_association(:courses)
    badge.macro == :has_many
    assert badge.validate?
  end
  
  test "valid badge associated profile" do
    badge = Badge.reflect_on_association(:profile)
    
    assert badge.macro == :belongs_to
    
  end  
end
