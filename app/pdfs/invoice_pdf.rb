class InvoicePdf < Prawn::Document
  def initialize(invoice, view)
    super(margin: 20, page_size: "A4")
    @invoice = invoice
    @view = view
    stroke_axis
    logo
    company_address
    stroke_across
    person_details
    invoice_details
    generate_table
  end

  def company_address
    move_down 23
    text "Plot 760 Trelawyn Park Inyatsi House,", size: 10
    text "369 David Hynd Road, ", size: 10
    text "Manzini, M200", size: 10
    move_down 35

  end

  def generate_table
    move_cursor_to 580
    table_container = [["Description","Unit Cost","Quantity","Tax","Line Total"]]

    @invoice.line_items.each do |line|
      table_container << [line.description,line.unit_cost,line.quantity,"%#{line.tax}",price(line.total)]
    end
    table_container << ["","","","","Total: #{price @invoice.total}"]
    table_container << ["","","","","Amount Paid: #{price(@invoice.payments.sum(:amount))}"]
    table_container << ["","","","","Amount Remaining: #{price(@invoice.total - @invoice.payments.sum(:amount))}"]

    table(table_container)

  end

  def invoice_details
      bounding_box [350,680], :width=>200, :height=> 50 do
        text "Invoice#: #{@invoice.id}",size: 12, style: :bold
        text "Date of Invoice: #{@invoice.invoice_date}",size: 12, style: :bold
        text "Amount Due: #{price(@invoice.total-@invoice.payments.sum(:amount), "E ")}",size: 12, style: :bold
      end
  end

  def logo
    y_position = bounds.top
    image ::Rails.root.join('public','images','logo.jpg'), at: [bounds.right-150,y_position], :width => 150

  end

  def person_details
    move_down 10
    text @invoice.person.to_s, size: 15, style: :bold
    text @invoice.person.home_address, size: 12, style: :bold
    text @invoice.person.post_address, size: 12, style: :bold
    text @invoice.person.city, size: 12, style: :bold
    text @invoice.person.email, size: 12, style: :bold
    text @invoice.person.tel_mobile, size: 12, style: :bold
  end

  def price(num, symbol = "E ")
    @view.number_to_currency(num, :unit => symbol)
  end

  def stroke_across
    stroke do
      self.line_width= 1
      horizontal_rule
    end

  end

  def stroke_axis(options={})
    options = { :height => (cursor - 20).to_i,
                :width => bounds.width.to_i
              }.merge(options)

    dash(1, :space => 4)
    stroke_horizontal_line(-21, options[:width], :at => 0)
    stroke_vertical_line(-21, options[:height], :at => 0)
    undash

    fill_circle [0, 0], 1

    (100..options[:width]).step(100) do |point|
      fill_circle [point, 0], 1
      draw_text point, :at => [point-5, -10], :size => 7
    end

    (100..options[:height]).step(100) do |point|
      fill_circle [0, point], 1
      draw_text point, :at => [-17, point-2], :size => 7
    end
  end

end
