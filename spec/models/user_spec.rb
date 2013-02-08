require 'spec_helper'

describe User do

  subject(:user) { User.create(email: "Example@dartmouth.edu", first_name: "Ex", last_name: "ample",
                     password: "foobar", password_confirmation: "foobar") }

  it { should respond_to(:first_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:dresses) }

  describe "when last_name is blank" do
    before {user.last_name = ""}
    it  { should_not be_valid }
  end

  describe "when email is blank" do
    before { user.email = "" }
    it  { should_not be_valid }
  end

  describe "when email is repeated" do
    before do
      user1 = User.create!(first_name: "Hello", last_name: "User", email: "example@Dartmouth.edu", password: "foobar")
    end
    it { should be_invalid }
  end

  describe "when name is repeated" do
    before do
      user1 = User.create!(first_name: "Ex", last_name: "ample", email: "binna@dartmouth.edu", password: "foobar")
    end
    it { should be_valid }
  end

  describe "when email is an invalid format" do 
    before { user.email = "example@example.com" }
    it  { should_not be_valid }
  end


end