class CoverSwatch
  PAIRS = [
    ["58474F", "F6D5EF"],
    ["E539AE", "FFF7FF"],
    ["C7B935", "6C0B4E"],
    ["020300", "F9A8B1"],
    ["FBE777", "343233"],
    ["598435", "FEFCFF"],
    ["FFCD00", "0A4574"],
    ["F3EB96", "752F0D"],
    ["423F46", "DFDFDF"],
    ["003759", "ED6461"]
  ]

  def self.choose_combination
    self.new(PAIRS.sample)
  end

  attr_reader :background, :text

  def initialize(combo)
    @background, @text = combo
  end
end
