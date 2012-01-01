require 'test_helper'

class InitiativesControllerTest < ActionController::TestCase
  fixtures  :portfolios
  setup do
    @initiative = initiatives(:Project1)
    @portfolio=portfolios(:Portfolio1)
  end

  test "has portfolio" do
    assert_equal @initiative.portfolios.count(),1,"should have had one portfolio, had #{@initiative.portfolios.count()} "
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:initiatives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create initiative" do
    assert_difference('Initiative.count') do
      post :create, {initiative: @initiative.attributes,portfolios: [@portfolio.id]}
    end

    assert_redirected_to initiative_path(assigns(:initiative))
  end

  test "should show initiative" do
    get :show, id: @initiative.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @initiative.to_param
    assert_response :success
  end

  test "should update initiative" do
    put :update, id: @initiative.to_param, initiative: @initiative.attributes
    assert_redirected_to initiative_path(assigns(:initiative))
  end

  test "should destroy initiative" do
    assert_difference('Initiative.count', -1) do
      delete :destroy, id: @initiative.to_param
    end

    assert_redirected_to initiatives_path
  end
end
