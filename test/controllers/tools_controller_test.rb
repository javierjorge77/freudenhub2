require "test_helper"

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tools_new_url
    assert_response :success
  end
end
