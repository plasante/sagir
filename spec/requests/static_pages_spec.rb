require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Mon epicerie'" do
      # visit is a Capybara function to simulate visiting the URL /static_pages/home in a browser
      visit '/static_pages/home'
      # we express the expectation that the resulting page should have the right content
      expect(page).to have_content('Mon epicerie')
    end
    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("Mon epicerie | Acceuil")
    end
  end
  
  describe "Help page" do
    it "should have the content 'Aide'" do
      visit '/static_pages/help'
      expect(page).to have_content('Aide')
    end
    it "shojuld have the title 'Aide'" do
      visit '/static_pages/help'
      expect(page).to have_title("Mon epicerie | Aide")
    end
  end
  
  describe "About page" do
    it "should have the content 'A Propos'" do
      visit '/static_pages/about'
      expect(page).to have_content('A Propos')
    end
    it "should have the title 'A Propos'" do
      visit '/static_pages/about'
      expect(page).to have_title('Mon epicerie | A Propos')
    end
  end
end
