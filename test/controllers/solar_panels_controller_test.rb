require 'test_helper'

class SolarPanelsControllerTest < ActionController::TestCase
  setup do
    @solar_panel = solar_panels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solar_panels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solar_panel" do
    assert_difference('SolarPanel.count') do
      post :create, solar_panel: { description: @solar_panel.description, title: @solar_panel.title }
    end

    assert_redirected_to solar_panel_path(assigns(:solar_panel))
  end

  test "should show solar_panel" do
    get :show, id: @solar_panel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solar_panel
    assert_response :success
  end

  test "should update solar_panel" do
    patch :update, id: @solar_panel, solar_panel: { description: @solar_panel.description, title: @solar_panel.title }
    assert_redirected_to solar_panel_path(assigns(:solar_panel))
  end

  test "should destroy solar_panel" do
    assert_difference('SolarPanel.count', -1) do
      delete :destroy, id: @solar_panel
    end

    assert_redirected_to solar_panels_path
  end
end
