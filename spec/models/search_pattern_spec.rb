require 'spec_helper'

describe SearchPattern do

  it "treats 'foo*' as a 'begins with' query" do
    SearchPattern.new('foo*').to_query.should == "foo%"
  end
  
  it "treats '*able' as an 'ends with' query" do
    SearchPattern.new('*able').to_query.should == "%able"    
  end
  
  it "treats 'dog' as a 'contains' query" do
    SearchPattern.new('dog').to_query.should == "%dog%"
  end
  
end
