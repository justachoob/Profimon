require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid skill name" do 
  	object = Skill.new
  	object.name = ""
  	object.gpa_required = 1
    object.stamina = 1
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end
  
  test "valid skill stamina max" do 
  	object = Skill.new
  	object.name = "purple"
  	object.gpa_required = 1
    object.stamina = 240
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end
  test "valid skill stamina min" do 
  	object = Skill.new
  	object.name = "purple"
  	object.gpa_required = 1
    object.stamina = -240
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end  
  test "valid skill knowledge min" do 
  	object = Skill.new
  	object.name = "purple"
  	object.gpa_required = 1
    object.stamina = 1
    object.knowledge = -55
    object.homework = 1
  	assert_not object.valid?
  end
  test "valid skill knowledge max" do 
  	object = Skill.new
  	object.name = "purple"
  	object.gpa_required = 1
    object.stamina = 1
    object.knowledge = 255
    object.homework = 1
  	assert_not object.valid?
  end
  test "valid skill homework min" do 
  	object = Skill.new
  	object.name = "purple"
  	object.gpa_required = 1
    object.stamina = 1
    object.knowledge = 1
    object.homework = -44
  	assert_not object.valid?
  end
  test "valid skill homework max" do 
  	object = Skill.new
  	object.name = "purple"
  	object.gpa_required = 1
    object.stamina = 1
    object.knowledge = 1
    object.homework = 244
  	assert_not object.valid?
  end  
  test "valid skill gpa max" do 
  	object = Skill.new
  	object.name = "purple"
  	object.gpa_required = 24
    object.stamina = 1
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end  
  test "valid skill gpa min" do 
  	object = Skill.new
  	object.name = "purple"
  	object.gpa_required = -24
    object.stamina = 1
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end  
end
