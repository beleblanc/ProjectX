class DepartmentOperationsController < ApplicationController

  def index
    @department_operation = DepartmentOperation.order(:name).where("name like ? or code like ?", "%#{params[:term]}%", "%#{params[:term]}%")
    render json: @department_operation.map(&:code_name)

  end


  def get_operation_price
    @person = Person.find(params[:person_id])
    @department_operation = DepartmentOperation.find(params[:department_operation])
    @price = Price.where(:priceable_type => @department_operation.class.to_s, :priceable_id => @department_operation.id, :medical_aid_plan_id => params[:medical_aid_plan_id]).first

    respond_to do |format|
      format.js {render :json=> {price: @price.price}}
    end

  end

  private
  def format_prices(prices)
    return_string = "<div id='price_block'> "
    prices.each do |price|
      return_string << "<span>#{MedicalAidPlan.find(price.medical_aid_id).plan_name}: E#{price.price}</span><br />"
    end
    return_string << "</div>"
    return_string
  end
end
