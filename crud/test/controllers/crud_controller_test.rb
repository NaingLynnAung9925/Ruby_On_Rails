require "test_helper"

class CrudControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get crud_new_url
    assert_response :success
  end
end
