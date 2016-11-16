require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
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

end
