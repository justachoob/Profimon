require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @profile = profiles(:one)
    @pskill = profimon_skills(:one)
  end
  test "should get new" do
    log_in_as(users(:one))
    get skills_new_url
    assert_response :success
  end

  test "should get create" do
    log_in_as(users(:one))
    get skills_create_url, params: { skill: {name: "MyString", stamina: 1, subject: "MyString", knowledge: 1, homework: 1 }}
    assert_redirected_to skills_path
  end
  
  test "should get list of skills" do
    log_in_as(users(:one))
    #get "/admin"
    get "/skills"
    assert_response :success
    
    assert_select "h1", "List of Skills"
    
  end

  test "should get list of profimon skills" do
    log_in_as(users(:one))
    #get "/admin"
    get "/profimon_skills"
    assert_response :success
    
    assert_select "h1", "List of Profimon Skills"
    
  end
  
  test "should post to profimon skills" do
    
    
   
    log_in_as(users(:one))
    post profimon_skills_path, params: { profimon_skill: { name: @pskill.name, subject: @pskill.subject, stamina: @pskill.stamina, knowledge: @pskill.knowledge, homework: @pskill.homework }  }
      
     
    
    assert_redirected_to profimon_skills_url
  end
  
  
end
