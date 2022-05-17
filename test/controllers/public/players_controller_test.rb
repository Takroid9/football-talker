require 'test_helper'

class Public::PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_players_index_url
    assert_response :success
  end

  test "should get show" do
    get public_players_show_url
    assert_response :success
  end

end
