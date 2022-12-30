require "test_helper"

class WebAdmin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_admin_items_index_url
    assert_response :success
  end

  test "should get show" do
    get web_admin_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get web_admin_items_edit_url
    assert_response :success
  end
end
