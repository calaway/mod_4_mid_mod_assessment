require 'rails_helper'

RSpec.feature "Unauthenticated User Signs Ups", type: :feature do
  scenario "they see the root path" do
    visit new_user_path

    expect(page).to have_content("Sign Up")

    fill_in "user[email]", with: "c@calaway.cc"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    new_user = User.last

    expect(current_path).to eq root_path
    expect(new_user.email).to eq "c@calaway.cc"
  end
end
