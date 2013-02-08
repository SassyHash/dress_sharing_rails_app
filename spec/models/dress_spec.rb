require 'spec_helper'

describe Dress do

  subject(:dress) { Dress.create(color: "Blue", owner_id: nil,
                  size: "medium", rent: 10) }

  it { should respond_to(:color) }
  it { should respond_to(:owner_id) }
  it { should respond_to(:color) }
  it { should respond_to(:rent) }
  it { should respond_to(:owner) }

  describe "can assign non mandatory attributes" do
    before {dress.brand = "Chanel"}
    its(:brand) {should == "Chanel"}
    its(:notes) {should == nil}
  end
end