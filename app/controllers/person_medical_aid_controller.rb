class PersonMedicalAidController < ApplicationController
   # GET /people
  # GET /people.json
  def index
    @p_med_aid = PersonMedicalAid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @p_med_aid }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @p_med_aid = PersonMedicalAid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @p_med_aid }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @p_med_aid = PersonMedicalAid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @p_med_aid }
    end
  end

  # GET /people/1/edit
  def edit
    @p_med_aid = PersonMedicalAid.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @p_med_aid = PersonMedicalAid.new(params[:person])

    respond_to do |format|
      if @p_med_aid.save
        format.html { redirect_to @p_med_aid, notice: 'Medical Aid was successfully created.' }
        format.json { render json: @p_med_aid, status: :created, location: @p_med_aid }
      else
        format.html { render action: "new" }
        format.json { render json: @p_med_aid.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /people/1
  # PUT /people/1.json
  def update
    @p_med_aid = PersonMedicalAid.find(params[:id])

    respond_to do |format|
      if @p_med_aid.update_attributes(params[:person_medical_aid])
        format.html { redirect_to @p_med_aid, notice: 'Medical Aid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @p_med_aid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @p_med_aid = PersonMedicalAid.find(params[:id])
    @p_med_aid.destroy

    respond_to do |format|
      format.html { redirect_to people_url(@p_med_aid.people_id) }
      format.json { head :no_content }
    end
  end
end
