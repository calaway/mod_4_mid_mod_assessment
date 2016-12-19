require 'rails_helper'

RSpec.feature "Unauthenticated User Signs Ups", type: :feature do
  scenario "they see the root path" do
    visit new_user_path

    expect(page).to have_content("Sign Up")
save_and_open_page
    fill_in "email address", with: "c@calaway.cc"
    fill_in "password", with: "password"
    fill_in "password confirmation", with: "password"
  end
end
