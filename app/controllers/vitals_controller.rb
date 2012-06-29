class VitalsController < ApplicationController



  def index
      @vitals = Vital.all
  
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @vitals }
      end
    end
  
    def show
      @vitals = Vital.find(params[:id])
  
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @vitals }
      end
    end
  
    def new
      @vital = Vital.new
  
      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @vital }
      end
    end
  
    def create
      @vital = Vital.new(params[:vital])
  
      respond_to do |format|
        if @vital.save
          format.html { redirect_to @vital, notice: 'Vital was successfully created.' }
          format.json { render json: @vital, status: :created, location: @vital }
        else
          format.html { render action: "new" }
          format.json { render json: @vital.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
  
    def edit
      @vital = Vital.find(params[:id])
    end
  
    def update
      @vital = Vital.find(params[:id])
  
      respond_to do |format|
        if @vital.update_attributes(params[:vital])
          format.html { redirect_to @vital, notice: 'Vital was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @vital.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
  
    def destroy
      @vital = Vital.find(params[:id])
      @vital.destroy
  

  
    end
  
end