require "test_helper"

class WebAdmin::ContributorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_admin_contributors_index_url
    assert_response :success
  end

  test "should get show" do
    get web_admin_contributors_show_url
    assert_response :success
  end

  test "should get edit" do
    get web_admin_contributors_edit_url
    assert_response :success
  end
end
