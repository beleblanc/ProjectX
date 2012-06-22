class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new()
    @payment.invoice_id = params[:invoice_id]
  end

  def create
    @payment = Payment.new(params[:payment])

    @payment.invoice.payment_date = @payment.payment_date  if @payment.invoice.payments.sum(:amount) >= @payment.invoice.total

    if @payment.save!

      redirect_to @payment.invoice, notice: "Payment successfully captured"
    else
      render action: "new"
    end

  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update_attributes(params[:payment])
      redirect_to @payment.invoice, notice: "Payment successfully updated"
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    redirect_to @payment.invoice, :notice => "Payment Sucessfully deleted"
  end
end
