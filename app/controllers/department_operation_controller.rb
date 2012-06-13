class DepartmentOperationController < ApplicationController


  def get_operation_price
    @person = Person.find(params[:person_id])
    @department_operation = DepartmentOperation.find(params[:department_operation])
    @prices = Price.where(:priceable_type => @department_operation.class.to_s, :priceable_id => @department_operation.id, :medical_aid_plan_id => @person.person_medical_aids.map { |x| x.medical_aid_plan_id})

    respond_to do |format|
      format.js
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
