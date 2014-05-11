require 'spec_helper'

describe Usager do
  before {
    @usager = Usager.new( name: "Example User", 
                          email: "user@example.com",
                          password: "foobar",
                          password_confirmation: "foobar" )
  }
  
  subject { @usager }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  # This is to verify that the subject(@usager) is initially valid.
  it { should be_valid }
  
  describe "when name is not present" do
    before { @usager.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @usager.email = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @usager.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @usager.email = invalid_address
        expect(@usager).not_to be_valid
      end
    end
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM a+b@baz.com]
      addresses.each do |valid_address|
        @usager.email = valid_address
        expect(@usager).to be_valid
      end
    end
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @usager.dup
      user_with_same_email.email = @usager.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before do
      @usager = Usager.new(name: "Usager",
                           email: "usager@example.com",
                           password: " ",
                           password_confirmation: " ")
    end
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @usager.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "return value of authenticate method" do
    before { @usager.save }
    let(:found_user) { Usager.find_by(email: @usager.email) }
    
    describe "with valid password" do
      it { should eq found_user.authenticate(@usager.password) }
    end
    
    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
  
  describe "with a password that's too short" do
    before { @usager.password = @usager.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end
end
