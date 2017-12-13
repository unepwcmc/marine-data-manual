require 'test_helper'

class DataLimitationsControllerTest < ActionController::TestCase

  test "index action returns 200" do
    get :index
    assert_response :success
  end

end
