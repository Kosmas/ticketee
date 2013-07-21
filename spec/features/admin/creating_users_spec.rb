require 'spec_helper'

feature "Creating Users" do
  let!(:admin) { FactoryGirl.create(:admin_user) }

  before do
    sign_in_as!(admin)
    visit '/'
    click_link "Admin"
    click_link "Users"
    click_link "New User"
  end

  scenario 'Creating a new user' do
    fill_in "Email", with: "newbie@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Create User"
    expect(page).to have_content("User has been created.")
  end

  scenario "Creating an admin user" do
    fill_in "user_email", with: "something@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    check "Is an admin?"
    click_button "Create User"
    expect(page).to have_content("User has been created")
    within("#users") do
      binding.pry
      expect(page).to have_content("something@example.com (Admin)")
    end
  end
end
