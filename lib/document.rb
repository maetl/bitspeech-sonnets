class Document
  include Prawn::View

  def initialize(timestamp)
    @timestamp = timestamp
    @document = Prawn::Document.new(page_size: "A4")
    font_families.update(
      "Bagnard" => {
        normal: "fonts/Bagnard.ttf"
      },
      "Baskerville" => {
        normal: "fonts/LibreBaskerville-Regular.ttf"
      }
    )
    @swatch = CoverSwatch.choose_combination
  end

  def render_standalone_page(title, content_path)
    start_new_page(margin: 72)

    font("Bagnard") do
      move_down 384
      font_size(18) { text(title) }
    end

    font("Baskerville") do
      move_down 12
      text(File.read(content_path))
    end
  end

  def render_preface
    render_standalone_page("Preface", "./content/preface.txt")
  end

  def render_colophon
    render_standalone_page("Colophon", "./content/colophon.txt")
  end

  def render_copyright
    start_new_page(margin: 90)

    font("Baskerville") do
      move_down 384
      text(File.read("./content/copyright.txt"), align: :center)
    end
  end

  def render_half_title
    start_new_page(margin: 72)

    font("Bagnard") do
      move_down 128
      font_size(18) { text("The Bitspeech Sonnets", align: :center) }
    end
  end

  def render_title
    start_new_page(margin: 90)

    font("Bagnard") do
      move_down 128
      font_size(36) { text("The Bitspeech Sonnets", align: :center) }
      move_down 18
      font_size(18) { text("By Mark Rickerby", align: :center) }
    end
  end

  def render_body(poems)
    start_new_page(margin: 72)

    poems.each do |poem|
      font("Bagnard") do
        font_size(16) { text(poem.title) }
      end

      font("Baskerville") do
        move_down 16
        text(poem.to_text)
        move_down 36
      end
    end
  end

  def render_cover
    canvas do
      fill_color @swatch.background
      fill_rectangle [bounds.left, bounds.top], bounds.right, bounds.top

      font("Bagnard") do
        move_down 228
        font_size(92) { text("The\nBitspeech\nSonnets", leading: -8, align: :center, color: @swatch.text) }
        move_down 264
        font_size(28) { text("A computer-generated book\nby Mark Rickerby", align: :center, color: @swatch.text) }
      end

      move_cursor_to bounds.bottom
    end
    fill_color "111111"
  end

  def overlay_page_numbers
    font("Baskerville") do
      number_pages("<page>", {start_count_at: 7, page_filter: ->pg{pg > 6} , align: :right, size: 10, at: [bounds.right - 50, 0]})
    end
  end

  def render_sections(poems)
    render_cover
    render_half_title
    render_title
    render_copyright
    render_preface
    start_new_page
    render_body(poems)
    start_new_page
    render_colophon
    overlay_page_numbers
  end
end
