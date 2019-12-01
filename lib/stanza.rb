class Stanza
  def initialize(lines)
    @lines = lines
  end

  def word_count
    @lines.reduce(0) do |count, line|
      count += line.size
      count
    end
  end

  def first_line
    @lines.first.map(&:capitalize).join(" ")
  end

  def last_line
    @lines.last.map(&:capitalize).join(" ")
  end

  def end_rhymes
    @lines.map { |l| l.last.capitalize }
  end

  def line_punctuation
    [",", ",", ",", ",", ",", ",", ";", ";", "", "", "", "", "", "", "!"].sample
  end

  def stanza_punctuation
    [".", ".", ""].sample
  end

  def to_text
    lines = @lines.map do |line|
      line.join(" ").capitalize + line_punctuation
    end
    lines.last << stanza_punctuation if lines.last[-1] =~ /[a-z]/
    lines.join("\n")
  end
end
