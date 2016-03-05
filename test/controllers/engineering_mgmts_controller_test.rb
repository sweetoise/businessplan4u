require 'test_helper'

class EngineeringMgmtsControllerTest < ActionController::TestCase
  setup do
    @engineering_mgmt = engineering_mgmts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engineering_mgmts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engineering_mgmt" do
    assert_difference('EngineeringMgmt.count') do
      post :create, engineering_mgmt: { description: @engineering_mgmt.description, title: @engineering_mgmt.title }
    end

    assert_redirected_to engineering_mgmt_path(assigns(:engineering_mgmt))
  end

  test "should show engineering_mgmt" do
    get :show, id: @engineering_mgmt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engineering_mgmt
    assert_response :success
  end

  test "should update engineering_mgmt" do
    patch :update, id: @engineering_mgmt, engineering_mgmt: { description: @engineering_mgmt.description, title: @engineering_mgmt.title }
    assert_redirected_to engineering_mgmt_path(assigns(:engineering_mgmt))
  end

  test "should destroy engineering_mgmt" do
    assert_difference('EngineeringMgmt.count', -1) do
      delete :destroy, id: @engineering_mgmt
    end

    assert_redirected_to engineering_mgmts_path
  end
end
