require 'rails_helper'


feature "visiting the homepage" do
  scenario "the user sees headline" do
    visit "/"

    expect(page).to have_content("texting center")
  end

  scenario "the user sees text field to input phone number" do
    visit "/"

    expect(page).to have_field("phone_number")
  end

  scenario "the user sees button to submit phone number" do
    visit "/"

    expect(page).to have_button("Text me a quote")
  end
end
