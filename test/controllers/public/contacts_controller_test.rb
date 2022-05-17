require 'test_helper'

class Public::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_contacts_new_url
    assert_response :success
  end

  test "should get conplete" do
    get public_contacts_conplete_url
    assert_response :success
  end

end
