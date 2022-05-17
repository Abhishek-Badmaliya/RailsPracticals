require "test_helper"

class TproductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = Nuser.find_by(role: "admin", email: "abx@gmail.com", encrypted_password: "password")
    @product = Tproduct.new(product_name: "Iphone", price: 50000, description: "5G", nuser_id: @user.id)
    @product.save
  end

  setup do
    sign_in @user
  end

  test "should get index" do
    get tproducts_path
    assert_response :success
  end

  test "should get show" do
    get tproduct_path(@product)
    assert_response :success
  end

  test "should get new" do
    get new_tproduct_path
    assert_response :success
  end

  test "should create product" do
    assert_difference("Tproduct.count") do
      post tproducts_path, params: { tproduct: { product_name: "News Paper", description: "news", price: 5, nuser_id: @user.id } }
    end
    assert_redirected_to tproducts_path
  end

  test "should destroy product" do
    assert_difference("Tproduct.count", -1) do
      delete tproduct_path(@product)
    end
    assert_redirected_to tproducts_url
  end
end
