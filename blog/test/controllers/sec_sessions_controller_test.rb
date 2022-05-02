require "test_helper"

class SecSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get sec_sessions_auth_url
    assert_response :success
  end

  test "should get create" do
    get sec_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sec_sessions_destroy_url
    assert_response :success
  end
end
