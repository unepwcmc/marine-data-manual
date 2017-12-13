require 'test_helper'

class MetadataControllerTest < ActionController::TestCase

  test "index action returns 200" do
    get :index
    assert_response :success
  end

end
