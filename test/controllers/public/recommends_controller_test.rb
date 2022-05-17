require 'test_helper'

class Public::RecommendsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_recommends_index_url
    assert_response :success
  end

end
