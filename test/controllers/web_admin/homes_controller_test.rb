require "test_helper"

class WebAdmin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get web_admin_homes_top_url
    assert_response :success
  end
end
