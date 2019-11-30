class Sonnet
  def initialize(lexicon)
    @lexicon = lexicon
    @distribution = Calyx::Grammar.new do
      start(lexicon.word_frequencies)
    end
  end

  def generate
    rhyme_scheme = RhymeScheme.choose_pattern

    end_rhymes = {}

    rhyme_scheme.each_rhyme do |line, count|
      root_rhyme = @lexicon.any_word
      end_rhymes[line] = [root_rhyme].concat(
        @lexicon.end_rhymes_for(root_rhyme, count - 1)
      ).shuffle
    end

    stanzas = []

    rhyme_scheme.each_stanza do |stanza|
      stanzas << Stanza.new(stanza.map do |line|
        decasyllabic_line(end_rhymes[line].pop)
      end)
    end

    Poem.new(stanzas)
  end

  def sample_next_word(syllables=nil)
    syllables = @distribution.generate.to_i unless syllables
    @lexicon.any_word_of_length(syllables)
  end

  def decasyllabic_line(last_word)
    word_sequence = [last_word.text]
    syllables_available = 10 - last_word.syllables

    while syllables_available > 0
      next_word = sample_next_word
      syllables_available -= next_word.syllables
      if syllables_available < 0
        word_sequence << sample_next_word(
          syllables_available + next_word.syllables
        ).text
      else
        word_sequence << next_word.text
      end
    end

    word_sequence.reverse
  end
end
