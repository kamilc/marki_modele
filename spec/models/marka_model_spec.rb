require File.dirname(__FILE__) + '/../spec_helper'

describe MarkaModel do
  before(:each) do
    @marka_model = MarkaModel.new
  end

  it "should be valid" do
    @marka_model.should be_valid
  end
end
