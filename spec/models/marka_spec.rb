require File.dirname(__FILE__) + '/../spec_helper'

describe Marka do
  before(:each) do
    @marka = Marka.new
  end

  it "should be valid" do
    @marka.should be_valid
  end
end
