class ConsultationsController < ApplicationController

  def index
    @consultations = Consultation.all

    respond_to do |format|
      format.html
    end

  end

  def new
    @consultation = Consultation.new
    if params.has_key?:wait_list_id
      @waitlist = WaitList.find(params[:wait_list_id])
      @waitlist.attended= true
      @waitlist.save
    end

    @consultation.person_id = params[:person_id]


    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @consultation }
    end

  end

  def create
    @consultation = Consultation.new(params[:consultation])

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to people_path, notice: 'Consultation was successfully created.' }
        format.json { render json: @consultation, status: :created, location: @consultation }

      else
        format.html { render action: "new" }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
     @consultation = Consultation.find(params[:id])

    respond_to do |format|
      format.html       #edit.hmtl.haml
    end
  end

  def show
    @consultation = Consultation.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render json: @consultation}
    end
  end

  def update
    @consultation = Consultation.find(params[:id])

    respond_to do |format|
      if @consultation.update_attributes(params[:consultation])
        format.html { redirect_to @consultation, notice: 'Consultation information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.status= "Closed"
    @consultation.save!

    respond_to do |format|
        format.html {redirect_to consultations_path, notice: "Consultation successfully closed"}
    end

  end

  def get_order_price
     person = Person.find(params[:person_id])
     order_type = DepartmentOperation.find(params[:department_operation])

     if person.person_medical_aids.exists?
       aid_plans = []
       person.person_medical_aids.each do |medaid|
         aid_plans << medaid.medical_aids_id
       end
       if !aid_plans.empty?
         prices =Price.where(:medical_aid_id=>aid_plans,:priceable_type=>order_type.class.to_s,:priceable_id=>order_type.id)
         respond_to do |format|
           format.json {render :text =>format_prices(prices) }
         end
       end
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
