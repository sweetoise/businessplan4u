require 'test_helper'

class EntrepreneurProgramsControllerTest < ActionController::TestCase
  setup do
    @entrepreneur_program = entrepreneur_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrepreneur_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entrepreneur_program" do
    assert_difference('EntrepreneurProgram.count') do
      post :create, entrepreneur_program: { description: @entrepreneur_program.description, topic: @entrepreneur_program.topic }
    end

    assert_redirected_to entrepreneur_program_path(assigns(:entrepreneur_program))
  end

  test "should show entrepreneur_program" do
    get :show, id: @entrepreneur_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entrepreneur_program
    assert_response :success
  end

  test "should update entrepreneur_program" do
    patch :update, id: @entrepreneur_program, entrepreneur_program: { description: @entrepreneur_program.description, topic: @entrepreneur_program.topic }
    assert_redirected_to entrepreneur_program_path(assigns(:entrepreneur_program))
  end

  test "should destroy entrepreneur_program" do
    assert_difference('EntrepreneurProgram.count', -1) do
      delete :destroy, id: @entrepreneur_program
    end

    assert_redirected_to entrepreneur_programs_path
  end
end
