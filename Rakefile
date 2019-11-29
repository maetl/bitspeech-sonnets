require_relative "lib/lexicon"
require_relative "lib/sonnet"
require_relative "lib/rhyme_scheme"
require "calyx"

lexicon = Lexicon.generate
sonnet = Sonnet.new(lexicon)

task :build do
  poem = sonnet.generate
  puts poem.to_text
  puts
  puts "#{poem.word_count} words"
end
