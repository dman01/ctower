require 'test_helper'

class PhasesControllerTest < ActionController::TestCase
  fixtures :portfolio_processes

  setup do
    @phase = phases(:Phase1)
  end

  test "should be redirected from index" do
    # if we try the index method without having a process defined we should be redirected
    # to the process overview as we do not allow for orphan phases
    get :index
    #assert_response :success
    assert_redirected_to portfolio_processes_path
   # assert_not_nil assigns(:phases)
  end

  test "should get index which is a list of phases for a specific process" do
      # if we try the index method with a specified process all phases should be listed
      p=portfolio_processes(:Process1)
      get :index,process_id: p.id
      assert_response :success
  end

  test "should get new" do
    get :new
    #assert_response :success
    assert_redirected_to portfolio_processes_path()
  end

  test "should create phase" do
    assert_difference('Phase.count') do
      post :create, phase: @phase.attributes
    end
    assert_not_nil assigns(:phase)
    assert_redirected_to phases_path(notice: 'Phase was successfully created.',process_id: @phase.portfolio_process_id)
    #assert_redirected_to phase_path(assigns(:phase))
  end


  test "should get edit" do
    get :edit, id: @phase.to_param
    assert_response :success
  end

  test "should update phase" do
    put :update, id: @phase.to_param, phase: @phase.attributes
    assert_not_nil assigns(:phase)
    assert_redirected_to phases_path(notice: 'Phase was successfully updated.', process_id: @phase.portfolio_process_id)
  end

  test "should destroy phase" do
    assert_difference('Phase.count', -1) do
      delete :destroy, id: @phase.to_param
    end

    assert_redirected_to phases_path
  end
end
