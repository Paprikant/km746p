require 'test_helper'

class DayControllerTest < ActionController::TestCase
  test "should get random" do
    get :random
    assert_response :success
  end

end
