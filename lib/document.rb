require "prawn"

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

  def render_body
    start_new_page(margin: 72)

    # @narrative.sections.each do |section|
    #   font(pov_font(section.pov)) do
    #     text(section.text)
    #   end
    #   font("Noto Serif") do
    #     text("\n\n§\n\n", align: :center)
    #   end
    # end
  end

  def render_cover
    canvas do
      fill_color "020300"
      fill_rectangle [bounds.left, bounds.top], bounds.right, bounds.top

      font("Bagnard") do
        move_down 228
        font_size(92) { text("The\nBitspeech\nSonnets", leading: -8, align: :center, color: "F9A8B1") }
        move_down 264
        font_size(28) { text("A computer-generated book\nby Mark Rickerby", align: :center, color: "F9A8B1") }
      end

      move_cursor_to bounds.bottom
    end
  end

  def render_sections
    render_cover
    render_half_title
    render_title
    render_copyright
    render_preface
    # start_new_page
    # render_body
    # start_new_page
    render_colophon
  end
end
