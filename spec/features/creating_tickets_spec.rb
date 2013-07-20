require 'spec_helper'

feature "Creating Tickets" do

  before do
    FactoryGirl.create(:project, name: "Internet Explorer")
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user, email: "sample@example.com")
    visit '/'
    click_link project.name
    click_link "New Ticket"
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    fill_in "Name", with: user.name # Book originally had 'User Name'
    fill_in "Password", with: user.password
    click_button "Sign in"
    click_link "Internet Explorer"
    click_link "New Ticket"
    within("h2") { expect(page).to have_content("New Ticket") }
  end

  scenario "Creating a ticket" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"
    expect(page).to have_content("Ticket has been created.")

    within "#ticket #author" do
      expect(page).to have_content("Created by sample@example.com")
    end

  end

  scenario "Creating a ticket without valid attributes fails" do
    click_button "Create Ticket"
    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "Description must be longer than 10 characters" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "it sucks"
    click_button "Create Ticket"
    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Description is too short")
  end

end