require 'test_helper'

class OurAdvantagesControllerTest < ActionController::TestCase
  setup do
    @our_advantage = our_advantages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:our_advantages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create our_advantage" do
    assert_difference('OurAdvantage.count') do
      post :create, our_advantage: { description: @our_advantage.description, title: @our_advantage.title }
    end

    assert_redirected_to our_advantage_path(assigns(:our_advantage))
  end

  test "should show our_advantage" do
    get :show, id: @our_advantage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @our_advantage
    assert_response :success
  end

  test "should update our_advantage" do
    patch :update, id: @our_advantage, our_advantage: { description: @our_advantage.description, title: @our_advantage.title }
    assert_redirected_to our_advantage_path(assigns(:our_advantage))
  end

  test "should destroy our_advantage" do
    assert_difference('OurAdvantage.count', -1) do
      delete :destroy, id: @our_advantage
    end

    assert_redirected_to our_advantages_path
  end
end
