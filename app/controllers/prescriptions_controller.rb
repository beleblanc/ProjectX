class PrescriptionsController < ApplicationController

  def prescription_price
     @pharmacy_inventory = PharmacyInventory.find(params[:id])
     @price = @pharmacy_inventory.prices.find_by_medical_aid_plan_id(params[:medical_aid_plan_id]).price

    if @price.nil?
      @price = @pharmacy_inventory.prices.find_by_medical_aid_plan_id(MedicalAidPlan.find_by_name("Cash").id).price
    end


    render json: {price: @price}

  end

  def create
    @prescription = Prescription.new(params[:prescription])

    if @prescription.save!
      redirect_to @prescription.soap.consultation, notice: "Prescription successfully captured"
    else
      redirect_to @prescription.soap.consultation, notice: "There was a problem with your prescription"
    end
  end
end
