require 'test_helper'

class AdminFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @profile = profiles(:one)
    @skill = skills(:one)
    @pskill = profimon_skills(:one)
  end
  
  test "should get admin show" do
    log_in_as(users(:one))
    get "/admin"
    
    assert_response :success
    
    #verify you are on admin settings page
    assert_select "h1", "Admin Settings"
    
  end
  
  test "should get skill creation page" do
    log_in_as(users(:one))
    get "/skills/new"
    
    assert_response :success
    
    assert_select "h1", "Create a Skill"
    
    
  end
  
  test "should get profimon skill creation page" do
    log_in_as(users(:one))
    get "/profimon_skills/new"
    
    assert_response :success
    
    assert_select "h1", "Create a Profimon Skill"
    
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
  
  test "should get error warning when post skills" do
    log_in_as(users(:one))
    #get "/admin"
    get "/skills"
    assert_response :success
    
    assert_select "h1", "List of Skills"
    
    assert_no_difference('profimon_skills.count') do
      post skills_url, params: { skill: { name: "purple"} }
    end
    
    assert_select "p", "The following errors occurred:"
    
  end

  test "should get error warning when post error" do
    log_in_as(users(:one))
    #get "/admin"
    get "/profimon_skills"
    assert_response :success
    
    assert_select "h1", "List of Profimon Skills"
    
    assert_no_difference('profimon_skills.count') do
      post profimon_skills_url, params: { profimon_skill: { name: "purple"} }
    end
    
    assert_select "p", "The following errors occurred:"
    
  end  
  test "should post to profimon skills" do
    
    
    
    log_in_as(users(:one))
    post profimon_skills_path, params: { profimon_skill: { name: @pskill.name, subject: @pskill.subject, stamina: @pskill.stamina, knowledge: @pskill.knowledge, homework: @pskill.homework }  }
   
     
    
    assert_redirected_to profimon_skills_url
  end
  
  test "should update count" do
    assert_difference('ProfimonSkill.count') do
      log_in_as(users(:one))
      post profimon_skills_path, params: { profimon_skill: { name: @pskill.name, subject: @pskill.subject, stamina: @pskill.stamina, knowledge: @pskill.knowledge, homework: @pskill.homework }  }
    end
    
    assert_redirected_to profimon_skills_url
  end
  test "should patch" do
    assert_no_difference('ProfimonSkill.count') do
      log_in_as(users(:one))
      get "/profimon_skills/1/edit", params: {id: 1}
      patch "/profimon_skills/1", params: { profimon_skill: { id: 1, name: @pskill.name, subject: @pskill.subject, stamina: @pskill.stamina, knowledge: @pskill.knowledge, homework: @pskill.homework }, id:1  }
    end
    
    assert_redirected_to profimon_skills_url
  end
  test "should delete" do
    assert_difference('ProfimonSkill.count', -1) do
      log_in_as(users(:one))
      delete profimon_skill_path(@pskill)
    end
    
    assert_redirected_to profimon_skills_url
  end
      
end
