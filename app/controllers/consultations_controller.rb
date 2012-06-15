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
    @consultation.medical_aid_plan_id = @waitlist.medical_aid_plan_id


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
        format.html {redirect_to new_invoice_path(:consultation_id=> @consultation.id, person_id: @consultation.person_id, medical_aid_plan_id: @consultation.medical_aid_plan_id), notice: "Consultation successfully closed"}
    end

  end




end
