class Poem
  def initialize(stanzas)
    @stanzas = stanzas
  end

  def to_text
    @stanzas.map do |stanza|
      stanza.to_text
    end.join("\n\n")
  end
end
