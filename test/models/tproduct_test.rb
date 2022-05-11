require "test_helper"
require "tproduct"

class TproductTest < ActiveSupport::TestCase
  def setup
    @user = Nuser.find_by(role: "admin" ,email: "abx@gmail.com", encrypted_password: "password")
    @product = Tproduct.new(product_name: "Book", price: 500, description: "For Reading", nuser_id: @user.id)
  end

  test "Product should be valid" do
    assert @product.valid?
  end

  test "Product name must be exist" do
    @product.product_name = ""
    assert_not @product.valid?
  end

  test "Product price must be exist" do
    @product.price = ""
    assert_not @product.valid?
  end

  test "Product description must be exist" do
    @product.description = ""
    assert_not @product.valid?
  end

  test "User must be exist" do
    @product.nuser_id = ""
    assert_not @product.valid?
  end

  test "Product should be save" do
    assert @product.save
  end
end
