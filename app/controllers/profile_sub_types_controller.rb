class ProfileSubTypesController < ApplicationController
  # GET /ProfileSubTypes
  # GET /ProfileSubTypes.json
  def index
    @ProfileSubTypes = ProfileSubType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ProfileSubTypes }
    end
  end

  # GET /ProfileSubTypes/1
  # GET /ProfileSubTypes/1.json
  def show
    @ProfileSubType = ProfileSubType.find(params[:id])
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @ProfileSubType }
    end
  end

  # GET /ProfileSubTypes/new
  # GET /ProfileSubTypes/new.json
  def new
    @ProfileSubType = ProfileSubType.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @ProfileSubType }
    end
  end

  # GET /ProfileSubTypes/1/edit
  def edit
    @ProfileSubType = ProfileSubType.find(params[:id])
  end

  # POST /ProfileSubTypes
  # POST /ProfileSubTypes.json
  def create
    @ProfileSubType = ProfileSubType.new(params[:ProfileSubType])

    respond_to do |format|
      if @ProfileSubType.save
        format.html { redirect_to @ProfileSubType, notice: 'Profile Sub Type was successfully created.' }
        format.json { render json: @ProfileSubType, status: :created, location: @ProfileSubType }
      else
        format.html { render action: "new" }
        format.json { render json: @ProfileSubType.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /ProfileSubTypes/1
  # PUT /ProfileSubTypes/1.json
  def update
    @ProfileSubType = ProfileSubType.find(params[:id])

    respond_to do |format|
      if @ProfileSubType.update_attributes(params[:ProfileSubType])
        format.html { redirect_to @ProfileSubType, notice: 'Profile Sub Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ProfileSubType.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ProfileSubTypes/1
  # DELETE /ProfileSubTypes/1.json
  def destroy
    @ProfileSubType = ProfileSubType.find(params[:id])
    @ProfileSubType.destroy

    respond_to do |format|
      format.html { redirect_to ProfileSubTypes_url }
      format.json { head :no_content }
    end
  end
end
