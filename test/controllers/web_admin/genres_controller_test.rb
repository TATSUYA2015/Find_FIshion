require "test_helper"

class WebAdmin::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_admin_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get web_admin_genres_edit_url
    assert_response :success
  end
end
