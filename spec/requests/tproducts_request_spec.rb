require "rails_helper"

RSpec.describe "Tproducts", type: :request do
  include Devise::Test::IntegrationHelpers

  setup do
    @user = Nuser.create(role: "admin", email: "abx@gmail.com", encrypted_password: "password")
    sign_in @user
  end

  it "get index path" do
    get tproducts_path
    expect(response).to be_successful
  end

  it "get new path" do
    get new_tproduct_path
    expect(response).to be_successful
  end
end
