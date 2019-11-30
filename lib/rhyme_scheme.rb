class RhymeScheme
  PATTERNS = [
    "ABBA ABBA CDE CDE",
    "ABBA ABBA CDC DCD",
    "ABBA CDDC EFG EFG",
    "ABAB CDCD EFEF GG",
    "ABAB BCBC CDCD EE"
  ]

  def self.choose_pattern
    self.new(PATTERNS.sample)
  end

  def initialize(pattern)
    @pattern = pattern
    @line_counts = pattern.gsub(" ", "").split("").reduce({}) do |rhymes,line|
      rhymes[line] = 0 unless rhymes.key?(line)
      rhymes[line] += 1
      rhymes
    end
  end

  def each_rhyme(&block)
    @line_counts.each_pair do |line, count|
      yield line, count
    end
  end

  def each_stanza(&block)
    @pattern.split(" ").each do |stanza|
      yield stanza.split("")
    end
  end
end
