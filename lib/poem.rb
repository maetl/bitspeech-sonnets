class Poem
  def initialize(stanzas)
    @stanzas = stanzas
    @titling = [:first_line, :end_rhymes].sample
  end

  def word_count
    @stanzas.reduce(0) do |count,stanza|
      count += stanza.word_count
      count
    end
  end

  def title
    case @titling
    when :first_line
      @stanzas.first.first_line
    when :end_rhymes
      @stanzas.sample.end_rhymes.join(" & ")
    end
  end

  def to_text
    @stanzas.map do |stanza|
      stanza.to_text
    end.join("\n\n")
  end
end
