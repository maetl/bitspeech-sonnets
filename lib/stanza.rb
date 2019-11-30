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

  def end_rhymes
    @lines.map { |l| l.last.capitalize }
  end

  def to_text
    @lines.map do |line|
      line.join(" ").capitalize
    end.join("\n")
  end
end
