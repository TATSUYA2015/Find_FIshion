require "test_helper"

class WebAdmin::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_admin_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get web_admin_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get web_admin_customers_edit_url
    assert_response :success
  end
end
