require 'spec_helper'

describe "StaticPages" do
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_content('Mon epicerie') }
    it { should have_title( full_title('') ) }
    it { should_not have_title('| Acceuil')}
  end
  
  describe "Help page" do
    before { visit help_path }
    
    it { should have_content('Aide') }
    it { should have_title( full_title('') ) }
    it { should_not have_title('| Aide')}
  end
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_content('A Propos') }
    it { should have_title( full_title('') ) }
    it { should_not have_title('| A Propos')}
  end

  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_content('Contact') }
    it { should have_title( full_title('Contactez-nous') ) }
  end
end
