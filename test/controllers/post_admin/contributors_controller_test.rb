require "test_helper"

class PostAdmin::ContributorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_admin_contributors_show_url
    assert_response :success
  end

  test "should get edit" do
    get post_admin_contributors_edit_url
    assert_response :success
  end
end
