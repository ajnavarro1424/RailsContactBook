require 'rails_helper'

RSpec.feature "CreateContacts", type: :feature do
  context "Landing Page" do
    Steps "Can visit landing page" do
      #Story: As a user, I can go to a landing page.
      Given "You start at index" do
        visit '/'
      end
      When "we enter a contact into the contact form" do
        fill_in 'given_name', with: "Bob"
        fill_in 'family_name', with: "Dob"
        fill_in 'email_address', with: "bob@dob.cob"
        fill_in 'home_address', with: "Lob Avenue"
        click_button 'Submit'
      end
      Then "it creates a new contact" do
        expect(page).to have_content("Bob")
      end
    end
  end
end
