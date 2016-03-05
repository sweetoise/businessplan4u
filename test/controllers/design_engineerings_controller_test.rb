require 'test_helper'

class DesignEngineeringsControllerTest < ActionController::TestCase
  setup do
    @design_engineering = design_engineerings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:design_engineerings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create design_engineering" do
    assert_difference('DesignEngineering.count') do
      post :create, design_engineering: { description: @design_engineering.description, title: @design_engineering.title }
    end

    assert_redirected_to design_engineering_path(assigns(:design_engineering))
  end

  test "should show design_engineering" do
    get :show, id: @design_engineering
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @design_engineering
    assert_response :success
  end

  test "should update design_engineering" do
    patch :update, id: @design_engineering, design_engineering: { description: @design_engineering.description, title: @design_engineering.title }
    assert_redirected_to design_engineering_path(assigns(:design_engineering))
  end

  test "should destroy design_engineering" do
    assert_difference('DesignEngineering.count', -1) do
      delete :destroy, id: @design_engineering
    end

    assert_redirected_to design_engineerings_path
  end
end
