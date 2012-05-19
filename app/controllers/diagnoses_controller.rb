class DiagnosesController < ApplicationController
  before_filter :find_diagnosis, :except => [:new,:create]

  def new
     @diagnosis = Diagnosis.new
     @diagnosis.soap_id = params[:soap_id]

    respond_to do |format|
      format.html
    end
  end

  def update


    respond_to do |format|
      if @diagnosis.update_attributes(params[:diagnosis])
        format.html {redirect_to @diagnosis.soap, notice: "Diagnosis successfully updated" }
      else
        format.html {render action: 'edit'}
      end

    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def edit
    respond_to do |format|
      format.html       #edit.hmtl.haml
    end
  end

  def create
    @diagnosis = Diagnosis.new(params[:diagnosis])

    respond_to do |format|
      if @diagnosis.save
          format.html{redirect_to @diagnosis.soap.consultation, notice: "Diagnosis successfully added to SOAP"}
      else
          format.html{ render action: 'new'}
      end
    end

  end

  def destroy
    @diagnosis.destroy

    respond_to do |format|
      format.html {redirect_to @diagnosis.soap, notice: "Diagnosis was destroyed"}
    end

  end
end
