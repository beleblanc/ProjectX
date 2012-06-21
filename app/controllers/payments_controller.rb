class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new()
  end

  def create
    @payment = Payment.new(params[:payment])

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

    if @payment.update_attributes([:payment])
      redirect_to @payment.invoice, notice: "Payment successfully updated"
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
  end
end
