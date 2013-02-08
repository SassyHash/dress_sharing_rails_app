require 'spec_helper'

describe Rental do

  subject(:rental) { Rental.create(start_date: Date.new(2012,5,16), end_date: Date.new(2012,5,23), user_id: 2, dress_id: 1) }

  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:dress_id) }
  it { should respond_to(:dress) }
  it { should respond_to(:user)}

  describe "when start_date is empty" do
    before {rental.start_date = ""}
    it  { should be_invalid }
  end

  describe "when start_date is after end_date" do
    before { rental.end_date = Date.new(2012,4,1) }
    it  { should_not be_valid }
  end

  describe "invalid when it doesn't have a dress" do
    before {rental.dress_id = nil }
    it { should be_invalid }
  end

  describe "invalid when it doesn't have a rental user" do
    before {rental.user_id = nil }
    it { should be_invalid }
  end
end