require "securerandom"
require "phonetic"
require "syllabize"
require_relative "bitspeech"
require_relative "word"
require_relative "rhyme"

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

  def any_word_of_length(length)
    @words_index[@syllables_index[length].sample]
  end

  def same_length_as(word)
    @words_index[@syllables_index[word.syllables].sample]
  end

  def end_rhymes_for(word, count=1)
    rhyme_list = []

    @vocabulary.each do |candidate|
      candidate_word = @words_index[candidate]
      next if (word.syllables - candidate_word.syllables).abs > 1

      if Rhyme.score(word.sounds, candidate_word.sounds) > 1
        rhyme_list << candidate_word
      end
    end

    rhyme_list.sample(count)
  end

  def word_frequencies
    @syllables_index.keys.reduce({}) do |frequency, syllables|
      frequency[syllables.to_s] = @syllables_index[syllables].size
      frequency
    end
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
