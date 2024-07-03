require 'prawn-html'

class PdfGenerator

  def initialize(html)
    @html = html
  end

  def print_data
    Prawn::Document.new do |pdf|
      pdf.font "Helvetica"
      PrawnHtml.append_html(pdf, @html)
    end
  end
end
