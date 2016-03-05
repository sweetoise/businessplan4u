require 'test_helper'

class ProgrammeControllerTest < ActionController::TestCase
  test "should get employment_skills" do
    get :employment_skills
    assert_response :success
  end

  test "should get outsourcing" do
    get :outsourcing
    assert_response :success
  end

  test "should get personal_coaching" do
    get :personal_coaching
    assert_response :success
  end

  test "should get finance_management" do
    get :finance_management
    assert_response :success
  end

end
