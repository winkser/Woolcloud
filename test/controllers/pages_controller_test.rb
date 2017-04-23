require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get friends" do
    get pages_friends_url
    assert_response :success
  end

  test "should get messages" do
    get pages_messages_url
    assert_response :success
  end

  test "should get friends_on_map" do
    get pages_friends_on_map_url
    assert_response :success
  end

  test "should get gallery" do
    get pages_gallery_url
    assert_response :success
  end

  test "should get cloud" do
    get pages_cloud_url
    assert_response :success
  end

  test "should get settings" do
    get pages_settings_url
    assert_response :success
  end

end
