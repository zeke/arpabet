ARPABET
=======

This is a rails webservice that finds rhymes by matching [Arpabet](http://en.wikipedia.org/wiki/Arpabet) transcriptions.

[arpabet.heroku.com](http://arpabet.heroku.com)

Query Params
------------

    :limit      -> defaults to 50
    :skip       -> defaults to 0
    :full       -> defaults to false. set any value to get back arpabet transcriptions in response objects
    :delimited  -> defaults to false. set any value to get back a semicolon-delimited string of words

Example Queries
---------------

- [/words/sleigh](http://arpabet.heroku.com/words/sleigh)
- [/words/sleigh?full=1](http://arpabet.heroku.com/words/sleigh?full=1)
- [/words/sleigh?delimited=1](http://arpabet.heroku.com/words/sleigh?delimited=1)
- [/words/sleigh?limit=10&skip=10](http://arpabet.heroku.com/words/sleigh?limit=10&skip=10)

Spec Output
-----------

    WordsController
      pagination
        defaults to 50 words per_page
        defaults to :page 1
        honors :limit param alone
        honors :limit param in conjunction with :skip param

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
        returns all words with transcriptions that match the given pattern

Developer Setup
---------------

    cp config/database.yml.example config/database.yml # postgres by default
    bundle
    rake db:create:all
    heroku db:pull
    rake

Credit
------

I got the ARPABET data from the [CMU Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict).