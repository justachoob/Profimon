require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid skill" do #Should be greater than or equal to 6 in length
  	object = Skill.new
  	object.name = ""
    object.stamina = 1
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end
end
