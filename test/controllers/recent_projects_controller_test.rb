require 'test_helper'

class RecentProjectsControllerTest < ActionController::TestCase
  setup do
    @recent_project = recent_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recent_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recent_project" do
    assert_difference('RecentProject.count') do
      post :create, recent_project: { description: @recent_project.description, title: @recent_project.title }
    end

    assert_redirected_to recent_project_path(assigns(:recent_project))
  end

  test "should show recent_project" do
    get :show, id: @recent_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recent_project
    assert_response :success
  end

  test "should update recent_project" do
    patch :update, id: @recent_project, recent_project: { description: @recent_project.description, title: @recent_project.title }
    assert_redirected_to recent_project_path(assigns(:recent_project))
  end

  test "should destroy recent_project" do
    assert_difference('RecentProject.count', -1) do
      delete :destroy, id: @recent_project
    end

    assert_redirected_to recent_projects_path
  end
end
