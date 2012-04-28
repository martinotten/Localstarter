require 'spec_helper'

describe Category do
  describe "Validation" do
    it "should not allow names with less than 3 characters" do
      Category.new(:name => "XX").should_not be_valid
    end

    it "should not allow names with more than 25 characters" do
      Category.new(:name => "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").should_not be_valid
    end

    it "should not be possible to use an empty name" do
      Category.new(:name => nil).should_not be_valid
    end

    it "should not be possible to use a name twice" do
      Category.create!(:name => "Music")
      Category.new(:name => "Music").should_not be_valid
    end
  end
end
