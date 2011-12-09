require 'test_helper'

class PortfolioProcessesControllerTest < ActionController::TestCase
  setup do
    @portfolio_process = portfolio_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portfolio_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portfolio_process" do
    assert_difference('PortfolioProcess.count') do
      post :create, portfolio_process: @portfolio_process.attributes
    end

    assert_redirected_to portfolio_process_path(assigns(:portfolio_process))
  end

  test "should show portfolio_process" do
    get :show, id: @portfolio_process.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @portfolio_process.to_param
    assert_response :success
  end

  test "should update portfolio_process" do
    put :update, id: @portfolio_process.to_param, portfolio_process: @portfolio_process.attributes
    assert_redirected_to portfolio_process_path(assigns(:portfolio_process))
  end

  test "should destroy portfolio_process" do
    assert_difference('PortfolioProcess.count', -1) do
      delete :destroy, id: @portfolio_process.to_param
    end

    assert_redirected_to portfolio_processes_path
  end
end
