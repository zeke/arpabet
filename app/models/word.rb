class Word < ActiveRecord::Base
  
  validates_uniqueness_of :spelling
  validates_presence_of :spelling
  validates_presence_of :arpabet_transcription
  
  before_save :clean_up_spelling
  before_save :clean_up_arpabet_transcription
  
  def to_param
    self.spelling
  end

  # Find words with similarly ending arpabet transcriptions
  # Try for maximum match depth, decrementing it until something comes back
  #
  def rhymes
    depth = self.arpabet_transcription.split(' ').size
    results = []
    
    while depth > 1 && results.empty?
      depth -= 1
      pattern = "*" + self.arpabet_transcription.split(' ').reverse.take(depth).reverse.join(' ')
      results = Word.find_by_transcription_pattern(pattern)
    end
    
    results
  end

  private
  
  def clean_up_spelling
    spelling.gsub!(/\W/, ' ')
    spelling.strip!
    arpabet_transcription.chomp!
    spelling.downcase!
  end
  
  def clean_up_arpabet_transcription
    arpabet_transcription.strip!
    arpabet_transcription.chomp!
  end
  
  def self.find_rhymes_for(spelling)
    word = Word.find_by_spelling(spelling).rhymes.map(&:spelling)
  end
  
  def self.transcribe(spelling)
    word = Word.first(:conditions => {:spelling => spelling})
    word.arpabet_transcription unless word.blank?
  end
  
  def self.find_by_transcription_pattern(pattern)
    Word.where("arpabet_transcription LIKE ?", SearchPattern.new(pattern).to_query)
  end
  
  def self.import_cmudict
    cmudict_file = Rails.root.join("db/cmudict.0.7a.txt")
    File.open(cmudict_file).readlines.each do |line|
      word = Word.new
      word.spelling, word.arpabet_transcription = line.chomp.split('  ')
      word.save!
      puts word.to_yaml
    end
  end
  
end
