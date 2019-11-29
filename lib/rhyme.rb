module Rhyme
  def self.score(word_phones, candidate_phones)
    word_primary, word_secondary = word_phones
    candidate_primary, candidate_secondary = candidate_phones

    if word_primary[-1] == candidate_primary[-1]
      word = word_primary.chars
      candidate = candidate_primary.chars
    elsif word_primary[-1] == candidate_secondary[-1]
      word = word_primary.chars
      candidate = candidate_secondary.chars
    elsif word_secondary[-1] == candidate_primary[-1]
      word = word_secondary.chars
      candidate = candidate_primary.chars
    elsif word_secondary[-1] == candidate_secondary[-1]
      word = word_secondary.chars
      candidate = candidate_secondary.chars
    else
      return 0
    end

    common_suffix = self.common_prefix(word.reverse, candidate.reverse)

    common_suffix.size
  end

  def self.common_prefix(a, b)
    a[0, b.size].take_while.with_index { |e, i| e == b[i] }
  end
end
