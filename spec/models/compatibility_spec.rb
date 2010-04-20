require File.dirname(__FILE__) + '/../spec_helper'

describe Compatibility do
  before(:each) do
    @compatibility = Compatibility.new
  end

  it "should be valid" do
    @compatibility.should be_valid
  end
end
