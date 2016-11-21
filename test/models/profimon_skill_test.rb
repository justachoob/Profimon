require 'test_helper'

class ProfimonSkillTest < ActiveSupport::TestCase
  test "valid profimon skill name" do 
  	object = ProfimonSkill.new
  	object.name = ""
    object.stamina = 1
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end
  test "valid profimon skill stamina min" do 
  	object = ProfimonSkill.new
  	object.name = "purple"
    object.stamina = -101
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end
  test "valid profimon skill sta max" do 
  	object = ProfimonSkill.new
  	object.name = "purple"
    object.stamina = 101
    object.knowledge = 1
    object.homework = 1
  	assert_not object.valid?
  end
  test "valid profimon skill knowledge min" do 
  	object = ProfimonSkill.new
  	object.name = "purple"
    object.stamina = 1
    object.knowledge = -101
    object.homework = 1
  	assert_not object.valid?
  end
  test "valid profimon skill know max" do 
  	object = ProfimonSkill.new
  	object.name = "purple"
    object.stamina = 1
    object.knowledge = 101
    object.homework = 1
  	assert_not object.valid?
  end
  test "valid profimon skill homework min" do 
  	object = ProfimonSkill.new
  	object.name = "purple"
    object.stamina = 1
    object.knowledge = 1
    object.homework = -101
  	assert_not object.valid?
  end
  test "valid profimon skill homework max" do 
  	object = ProfimonSkill.new
  	object.name = "purple"
    object.stamina = 1
    object.knowledge = 1
    object.homework = 101
  	assert_not object.valid?
  end
end
