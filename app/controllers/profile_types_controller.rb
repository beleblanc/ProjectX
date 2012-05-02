class ProfileTypesController < ApplicationController
  # GET /ProfileTypes
  # GET /ProfileTypes.json
  def index
    @ProfileTypes = ProfileType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ProfileTypes }
    end
  end

  # GET /ProfileTypes/1
  # GET /ProfileTypes/1.json
  def show
    @ProfileType = ProfileType.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @ProfileType }
    end
  end

  # GET /ProfileTypes/new
  # GET /ProfileTypes/new.json
  def new
    @ProfileType = ProfileType.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @ProfileType }
    end
  end

  # GET /ProfileTypes/1/edit
  def edit
    @ProfileType = ProfileType.find(params[:id])
  end

  # POST /ProfileTypes
  # POST /ProfileTypes.json
  def create
    @ProfileType = ProfileType.new(params[:profile_type])

    respond_to do |format|
      if @ProfileType.save
        format.html { redirect_to profile_types_path, notice: 'Profile Type was successfully created.' }
        format.json { render json: @ProfileType, status: :created, location: @ProfileType }
      else
        format.html { render action: "new" }
        format.json { render json: @ProfileType.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /ProfileTypes/1
  # PUT /ProfileTypes/1.json
  def update
    @ProfileType = ProfileType.find(params[:id])

    respond_to do |format|
      if @ProfileType.update_attributes(params[:profile_type])
        format.html { redirect_to @ProfileType, notice: 'Profile Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ProfileType.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ProfileTypes/1
  # DELETE /ProfileTypes/1.json
  def destroy
    @ProfileType = ProfileType.find(params[:id])
    @ProfileType.destroy

    respond_to do |format|
      format.html { redirect_to profile_types_url }
      format.json { head :no_content }
    end
  end
end
