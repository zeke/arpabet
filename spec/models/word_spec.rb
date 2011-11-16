require 'spec_helper'

describe Word do

  describe "validation" do
    
    before do
      @word = Factory(:word)
    end
    
    it "can be validated" do
      @word.should be_valid
    end
    
    # it "validates uniqueuness of spelling" do
    #   @word.save
    #   @word2 = @word.clone
    #   @word2.should_not be_valid
    # end
    
    it "requires spelling" do
      @word.spelling = ''
      @word.valid?.should == false
      @word.should have(1).error_on(:spelling)
    end
    
    it "requires arpabet_transcription" do
      @word.arpabet_transcription = ''
      @word.valid?.should == false
      @word.should have(1).error_on(:arpabet_transcription)
    end

    describe "before_save" do

      it "downcases spelling" do
        @word = Factory(:word, :spelling => 'CASE')
        @word.save
        @word.spelling.should == 'case'
      end

      it "replaces underscores in spelling with spaces" do
        @word = Factory(:word, :spelling => 'TWO-WORDS')
        @word.save
        @word.spelling.should == 'two words'
      end


      it "removes all non-word characters" do
        @word = Factory(:word, :spelling => '#? &#GUTS-yes-!')
        @word.save
        @word.spelling.should == 'guts yes'
      end

    end

  end  
  
  it "finds rhymes" do
    Factory(:funky).save
    Factory(:junkie).save
    Factory(:monkey).save
    Factory(:spunky).save
    funky = Word.find_by_spelling('funky')
    funky.rhymes.size.should == 4
  end
  
  describe "Word.transcribe(spelling)" do

    it "takes a spelling and gives back a transcription" do
      @word = Word.new(:spelling => "bob", :arpabet_transcription => "B AA1 B")
      @word.save
      Word.transcribe('bob').should == "B AA1 B"
    end
    
  end
  
  describe "Word.find_by_transcription_pattern(pattern)" do
    
    it "returns all words with transcriptions that match the given patten" do
      Word.create(:spelling => "bob", :arpabet_transcription => "B AA1 B")
      Word.create(:spelling => "sob", :arpabet_transcription => "B AA1 B")
      Word.create(:spelling => "dingo", :arpabet_transcription => "D IH1 NG G OW0")
      words = Word.find_by_transcription_pattern('*AA1 B')
      words.size.should == 2
    end
    
  end

end
