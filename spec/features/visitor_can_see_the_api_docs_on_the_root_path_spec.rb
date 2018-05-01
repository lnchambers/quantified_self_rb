require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the root path" do
    it "I can see the API docs" do
      visit root_path

      expect(page).to have_content("Quantified Self API Docs")
      expect(page).to have_content("GET")
      expect(page).to have_content("POST")
      expect(page).to have_content("PATCH")
      expect(page).to have_content("DELETE")
    end
  end
end
