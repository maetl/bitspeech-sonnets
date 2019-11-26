class Word
  attr_reader :text, :syllables, :sounds

  def initialize(text, syllables, sounds)
    @text = text
    @syllables = syllables
    @sounds = sounds
  end
end
