class InvoicesController < ApplicationController
  before_filter :find_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all
  end

  def department_operation_price
    @department_operation = DepartmentOperation.find_by_code(params[:key_string].split("-").first)
    @price = @department_operation.prices.find_by_medical_aid_plan_id(params[:person_medical_aid_id]).price

    render json: {price :@price}

  end

  def show

  end

  def new
    @invoice = Invoice.new(params[:invoice])
    @invoice.build_line_items
  end

  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save!
        format.html { redirect_to @invoice, notice: "Invoice Successfully created!" }
      else
        format.html { render :action => "new" }
      end
    end

  end

  def update
    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice :"Successfully updated invoice" }

      else
        format.html { render :action => "edit" }
      end


    end
  end

  def destroy
    @invoice.destroy!
    respond_to do |format|
      format.html { redirect_to @invoice.person, "Invoice succesfully destroyed" }
    end

  end


  private

  def find_invoice
    @invoice = Invoice.find(params[:id])
  end

end


