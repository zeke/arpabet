Factory.define :word do |w|
  w.spelling "!EXCLAMATION-POINT"
  w.arpabet_transcription "EH2 K S K L AH0 M EY1 SH AH0 N P OY2 N T"
end


Factory.define :funky, :class => :word do |w|
  w.spelling "funky"
  w.arpabet_transcription "F AH1 NG K IY0"
end

Factory.define :junkie, :class => :word do |w|
  w.spelling "junkie"
  w.arpabet_transcription "JH AH1 NG K IY0"
end

Factory.define :monkey, :class => :word do |w|
  w.spelling "monkey"
  w.arpabet_transcription "M AH1 NG K IY0"
end

Factory.define :spunky, :class => :word do |w|
  w.spelling "spunky"
  w.arpabet_transcription "S P AH1 NG K IY0"
end