require 'spec_helper'

describe WordsController do


  describe "pagination" do
    
    before do
      @word = Factory(:funky)
      Word.should_receive(:find_by_spelling).and_return(@word)
    end

    it "defaults to 50 words per_page" do
      get :show, :id => @word.spelling
      assigns(:per_page).should == 50
    end
    
    it "defaults to :page 1" do
      get :show, :id => @word.spelling
      assigns(:page).should == 1
    end

    it "honors :limit param alone" do
      get :show, :id => @word.spelling, :limit => 10
      assigns(:page).should == 1
      assigns(:per_page).should == 10
    end
  
    it "honors :limit param in conjunction with :skip param" do
      get :show, :id => @word.spelling, :limit => 20, :skip => 40
      assigns(:page).should == 3
      assigns(:per_page).should == 20
    end
    
  end

end