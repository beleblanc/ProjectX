class LabOrdersController < ApplicationController
  
  def new
    
  end
  
  def create
    @lab_order = LabOrder.new(params[:lab_order])
    
    if @lab_order.save!
      redirect_to @lab_order.soap.consultation, notice: "Lab Order successfully captured"
    else
      redirect_to @lab_order.soap.consultation, notice: "There was a problem with your Order"
    end
  end
  
  def edit
    
  end
  
  def show
    
  end
  
  def update
    
  end
  
  def index
    
  end
  
  def destroy
    @lab_order = find_lab_order
    
    @lab_order.destroy
    
    redirect_to @lab_order.soap.consultation, notice: "Lab Order Successfully removed"
  end
  
  
  def find_lab_order
    LabOrder.find(params[:id])
  end
end