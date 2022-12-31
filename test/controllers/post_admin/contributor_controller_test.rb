require "test_helper"

class PostAdmin::ContributorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_admin_contributor_show_url
    assert_response :success
  end

  test "should get edit" do
    get post_admin_contributor_edit_url
    assert_response :success
  end
end
