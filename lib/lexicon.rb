require "securerandom"
require "phonetic"
require "syllabize"
require_relative "bitspeech"
require_relative "word"

class Lexicon
  def initialize
    @vocabulary = []
    @words_index = {}
    @syllables_index = {}
  end

  def learn_word(word)
    @vocabulary << word

    syllables = word.count_syllables
    sounds = word.metaphone2

    @words_index[word] = Word.new(word, syllables, sounds)

    @syllables_index[syllables] = [] unless @syllables_index.key?(syllables)
    @syllables_index[syllables] << word
  end

  def any_word
    @words_index[@vocabulary.sample]
  end

  def syllabic_pair_with(word)
    @syllables_index[word].sample
  end

  def self.generate
    lexicon = self.new

    1.upto(65_544) do |i|
      lexicon.learn_word(Bitspeech.word_for(i.to_s(16)))
    end

    10_000.times do
      lexicon.learn_word(Bitspeech.word_for(SecureRandom.hex(3)))
    end

    1000.times do
      lexicon.learn_word(Bitspeech.word_for(SecureRandom.hex(4)))
    end

    lexicon
  end
end
