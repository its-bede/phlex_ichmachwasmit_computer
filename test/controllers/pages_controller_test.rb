require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get imprint" do
    get pages_imprint_url
    assert_response :success
  end

  test "should get privacy" do
    get pages_privacy_url
    assert_response :success
  end
end
