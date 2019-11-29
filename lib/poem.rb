class Poem
  def initialize(stanzas)
    @stanzas = stanzas
  end

  def word_count
    @stanzas.reduce(0) do |count,stanza|
      count += stanza.word_count
      count
    end
  end

  def to_text
    @stanzas.map do |stanza|
      stanza.to_text
    end.join("\n\n")
  end
end
