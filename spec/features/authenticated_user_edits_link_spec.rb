require 'rails_helper'

RSpec.feature "Authenticated user submits link", type: :feature do
  scenario "they see all their links" do
    user = User.create(email: "c@calaway.cc",
                       password: "password",
                       password_confirmation: "password")
    login(user)
    link = user.links.create(title: "The Big Idea", url: "www.example.com")

    visit links_path
    click_on "Edit"

    expect(current_path).to eq edit_link_path(link)
    expect(page).to have_content "Edit Link"

    fill_in "link[title]", with: "The Changed Idea"
    fill_in "link[url]", with: "www.example.com/2"
    click_button "Submit"

    expect(current_path).to eq links_path
    expect(page).to have_content "The Changed Idea"
    expect(page).to have_content "www.example.com/2"
  end
end
