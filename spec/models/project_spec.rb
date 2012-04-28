require 'spec_helper'
require 'project'

describe Project do
    describe "validation" do
        it "should fail for empty titles" do
             project = Project.new(
                title: nil,
            ).should_not be_valid
        end
        it "should fail for empty description" do
             project = Project.new(
                title: 'bla',
                description: nil,
            ).should_not be_valid
        end
    end
end
