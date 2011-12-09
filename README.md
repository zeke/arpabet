ARPABET
=======

This is a rails webservice that finds rhymes by matching [Arpabet](http://en.wikipedia.org/wiki/Arpabet) transcriptions.

[arpabet.heroku.com](http://arpabet.heroku.com)


Params

  :limit - defaults to 50
  :skip - defaults to 0
  :full - set to any value to include arpabet transcriptions in response objects
  :delimited - set to any value to get back a semicolon-delimited string of words

Features
--------

    SearchPattern
      treats 'foo*' as a 'begins with' query
      treats '*able' as an 'ends with' query
      treats 'dog' as a 'contains' query

    Word
      finds rhymes
      validation
        can be validated
        requires spelling
        requires arpabet_transcription
        before_save
          downcases spelling
          replaces underscores in spelling with spaces
          removes all non-word characters
      Word.transcribe(spelling)
        takes a spelling and gives back a transcription
      Word.find_by_transcription_pattern(pattern)
        returns all words with transcriptions that match the given patten

    Finished in 7.85 seconds
    12 examples, 0 failures

Credit
------

I got the ARPABET data from the [CMU Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict).