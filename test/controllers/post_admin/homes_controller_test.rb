require "test_helper"

class PostAdmin::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get post_admin_homes_top_url
    assert_response :success
  end
end
