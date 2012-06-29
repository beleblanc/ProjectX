class OrdersController < ApplicationController
  load_and_authorize_resource
  def index
      @orders = Order.all
  
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @orders }
      end
    end
  
    def show
      @orders = Order.find(params[:id])
  
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @orders }
      end
    end
  
    def new
      @order = Order.new
  
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @order }
      end
    end
  
    def create
      @order = Order.new(params[:order])
  
      respond_to do |format|
        if @order.save
          format.html { redirect_to @order.soap.consultation, notice: 'Order was successfully created.' }
          format.json { render json: @order, status: :created, location: @order }
        else
          format.html { render action: "new" }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
  
    def edit
      @order = Order.find(params[:id])
    end
  
    def update
      @order = Order.find(params[:id])
  
      respond_to do |format|
        if @order.update_attributes(params[:order])
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
  
    def destroy
      @order = Order.find(params[:id])
      @order.destroy

      respond_to do |format|
        format.html {redirect_to @order.soao.consultation, notice:"Order was successfully removed"}
      end
    end


    end

