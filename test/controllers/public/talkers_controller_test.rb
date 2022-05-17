require 'test_helper'

class Public::TalkersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_talkers_show_url
    assert_response :success
  end

end
