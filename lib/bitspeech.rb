module Bitspeech
  CONSONANTS = {
    "0000" => "p",
    "0001" => "b",
    "0010" => "t",
    "0011" => "d",
    "0100" => "k",
    "0101" => "g",
    "0110" => "ch",
    "0111" => "j",
    "1000" => "f",
    "1001" => "v",
    "1010" => "l",
    "1011" => "r",
    "1100" => "m",
    "1101" => "y",
    "1110" => "s",
    "1111" => "z"
  }

  VOWELS = {
    "0000" => "a",
    "0001" => "e",
    "0010" => "i",
    "0011" => "o",
    "0100" => "u",
    "0101" => "an",
    "0110" => "en",
    "0111" => "in",
    "1000" => "un",
    "1001" => "on",
    "1010" => "ai",
    "1011" => "ei",
    "1100" => "oi",
    "1101" => "ui",
    "1110" => "aw",
    "1111" => "ow"
  }

  def self.word_for(hex)
    bits = hex.chars.reduce("") do |b, char|
      b << char.hex.to_s(2).rjust(4, "0")
    end

    bits.prepend("0") while bits.length % 8 != 0

    bits.scan(/[01]{4}/).each_slice(2).reduce("") do |word, phoneme|
      word << CONSONANTS[phoneme.first] + VOWELS[phoneme.last]
    end
  end
end
