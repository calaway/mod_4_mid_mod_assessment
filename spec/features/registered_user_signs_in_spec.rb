require 'rails_helper'

RSpec.feature "Registered user signs in", type: :feature do
  scenario "they see the root path" do
    user = User.create(email: "c@calaway.cc",
                       password: "password",
                       password_confirmation: "password")

    visit new_session_path

    expect(page).to have_content("Sign In")

    fill_in "email", with: "c@calaway.cc"
    fill_in "password", with: "password"
    click_button "Sign In"

    expect(current_path).to eq root_path
  end
end
