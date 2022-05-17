require 'test_helper'

class Public::LeaguesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_leagues_index_url
    assert_response :success
  end

  test "should get show" do
    get public_leagues_show_url
    assert_response :success
  end

end
