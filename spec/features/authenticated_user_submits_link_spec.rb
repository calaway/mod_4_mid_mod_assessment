require 'rails_helper'

RSpec.feature "Authenticated user submits link", type: :feature do
  scenario "they see all their links" do
    user = User.create(email: "c@calaway.cc",
                       password: "password",
                       password_confirmation: "password")

    visit links_path

    expect(page).to have_content("Submit New Link")
    expect(page).to have_content("Your Links")

    fill_in "link[title]", with: "The Big Idea"
    fill_in "link[url]", with: "www.example.com"
    click_button "Submit"

    expect(current_path).to eq links_path
    expect(page).to have_content "The Big Idea"
    expect(page).to have_content "www.example.com"
  end
end
