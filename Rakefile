require_relative "lib/lexicon"
require_relative "lib/sonnet"
require_relative "lib/rhyme_scheme"
require "calyx"
require_relative "lib/book"
require_relative "lib/document"

#lexicon = Lexicon.generate
#sonnet = Sonnet.new(lexicon)

task :cover do
  book = Book.new
  book.generate
end

task :build do
  words = 0
  buffer = ""

  loop do
    begin
      poem = sonnet.generate
      buffer << poem.to_text
      words += poem.word_count
      puts words
    rescue
      puts "failed to generate"
    end
    break if words >= 50_000
  end

  File.write("book.txt", buffer)
end
