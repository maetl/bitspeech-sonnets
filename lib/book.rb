class Book
  def initialize(output_path: "output")
    @output_path = output_path
    @timestamp = Time.new.to_i
  end

  def generate
    generate_document(generate_poems)
  end

  def generate_poems
    lexicon = Lexicon.generate
    sonnet = Sonnet.new(lexicon)

    words = 0
    errors = 0
    poems = []

    loop do
      begin
        poem = sonnet.generate
        words += poem.word_count
        poems << poem
      rescue
        errors += 1
      end
      break if words >= 50_000
    end

    poems
  end

  def generate_document(poems)
    document = Document.new(@timestamp)
    document.render_sections(poems)
    document.save_as("#{@output_path}/book-#{@timestamp}.pdf")
  end
end
