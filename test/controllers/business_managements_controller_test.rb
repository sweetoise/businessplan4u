require 'test_helper'

class BusinessManagementsControllerTest < ActionController::TestCase
  setup do
    @business_management = business_managements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_managements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_management" do
    assert_difference('BusinessManagement.count') do
      post :create, business_management: { description: @business_management.description, title: @business_management.title }
    end

    assert_redirected_to business_management_path(assigns(:business_management))
  end

  test "should show business_management" do
    get :show, id: @business_management
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_management
    assert_response :success
  end

  test "should update business_management" do
    patch :update, id: @business_management, business_management: { description: @business_management.description, title: @business_management.title }
    assert_redirected_to business_management_path(assigns(:business_management))
  end

  test "should destroy business_management" do
    assert_difference('BusinessManagement.count', -1) do
      delete :destroy, id: @business_management
    end

    assert_redirected_to business_managements_path
  end
end
