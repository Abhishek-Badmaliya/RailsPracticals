require "rails_helper"

RSpec.feature "Nusers", type: :feature do
  given!(:nuser) { nuser = Nuser.create(role: "admin", email: "abx@gmail.com", encrypted_password: "password") }

  scenario "user must be have sign in" do
    visit "/nusers/sign_in"
    fill_in "Email", with: nuser.email
    fill_in "Password", with: nuser.password
    click_button "Log in"
    expect(page)
  end
end
