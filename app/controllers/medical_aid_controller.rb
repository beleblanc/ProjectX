class MedicalAidController < ApplicationController
  def index
    @medical_aids = MedicalAid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_aids }
    end
  end

  def show
    @medical_aid = MedicalAid.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_aid }
    end
  end

  def new
    @medical_aid = MedicalAid.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medical_aid }
    end
  end
  
  def create
    @medical_aid = MedicalAid.new(params[:medical_aid])

    respond_to do |format|
      if @medical_aid.save
        format.html { redirect_to @medical_aid, notice: 'Medical Aid was successfully created.' }
        format.json { render json: @medical_aid, status: :created, location: @medical_aid }
      else
        format.html { render action: "new" }
        format.json { render json: @medical_aid.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  def edit
    @medical_aid = MedicalAid.find(params[:id])


  end

  def update
      @medical_aid = MedicalAid.find(params[:id])
  
      respond_to do |format|
        if @medical_aid.update_attributes(params[:medical_aid])
          format.html { redirect_to @medical_aid, notice: 'Medical Aid was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @medical_aid.errors, status: :unprocessable_entity }
        end
      end
    end

  
   
   def destroy
     @medical_aid = MedicalAid.find(params[:id])
     @medical_aid.destroy
     
     respond_to do |format|
       format.html {redirect_to medical_aid_index}
       format.json {head :no_content}
    end   

   end

end
