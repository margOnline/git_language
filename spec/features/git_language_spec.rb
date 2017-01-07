require 'rails_helper'

RSpec.describe "show language", :type => :feature do
  scenario "User enters a valid git username" do
    visit "/"

    fill_in "username", :with => "margonline"
    click_button "Show language"

    expect(page).to have_text("Ruby")
  end

  scenario "User enters an invalid git username" do
    visit "/"

    fill_in "username", :with => "-xyz"
    click_button "Show language"

    expect(page).to have_text("Invalid username")
  end

  scenario "User enters username which is not found" do
    visit "/"

    fill_in "username", :with => "js_horse"
    click_button "Show language"

    expect(page).to have_text("Not Found")
  end

  scenario "User enters a username which has no public repositories" do
    visit "/"

    fill_in "username", :with => "horse"
    click_button "Show language"

    expect(page).to have_text("No public repos")
  end
end