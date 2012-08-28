require 'test_helper'

class DepartmentOperationControllerTest < ActionController::TestCase
  test "should get get_operation_price" do
    get :get_operation_price
    assert_response :success
  end

end
