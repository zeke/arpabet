class SearchPattern
  
  attr_accessor :pattern

  def initialize(pattern)
    self.pattern = pattern.to_s
  end
  
  def to_query
    if pattern.starts_with? '*'
      "%" + clean_pattern
    elsif pattern.ends_with? '*'
      clean_pattern + "%"
    else
      "%#{clean_pattern}%"
    end
  end
  
  def clean_pattern
    pattern.sub("*", '')
  end
  
end
