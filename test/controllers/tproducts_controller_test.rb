require "test_helper"

class TproductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tproducts_index_url
    assert_response :success
  end

  test "should get show" do
    get tproducts_show_url
    assert_response :success
  end

  test "should get new" do
    get tproducts_new_url
    assert_response :success
  end

  test "should get edit" do
    get tproducts_edit_url
    assert_response :success
  end
end
