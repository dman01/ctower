require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get casestudies" do
    get :casestudies
    assert_response :success
  end

end
