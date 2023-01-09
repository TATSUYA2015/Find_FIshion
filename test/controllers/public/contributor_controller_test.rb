require "test_helper"

class Public::ContributorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_contributor_show_url
    assert_response :success
  end
end
