class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @order = Order.new
  end

  def create
  end

  def destroy
  end
end
