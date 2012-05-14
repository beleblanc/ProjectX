class ProfileTypesController < ApplicationController
  def index
    @profile_types = ProfileType.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @profile_types }
    end
  end

  def show
    @profile_type = ProfileType.find(params[:id])

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @profile_type }
    end
  end

  def new
    @profile_type = ProfileType.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_type }
    end
  end

  def create
    @profile_type = ProfileType.new(params[:profile_type])

    respond_to do |format|
      if @profile_type.save
        format.html { redirect_to @profile_type, notice: 'Profile Type was successfully created.' }
        format.json { render json: @profile_type, status: :created, location: @profile_type}
      else
        format.html { render action: "new" }
        format.json { render json: @profile_type.errors, status: :unprocessable_entity }
      end
    end
  end



  def edit
    @profile_type = ProfileType.find(params[:id])
  end

  def update
    @profile_type = ProfileType.find(params[:id])

    respond_to do |format|
      if @profile_type.update_attributes(params[:profile_types])
        format.html { redirect_to @profile_type, notice: 'Profile Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile_type.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @profile_type = ProfileType.find(params[:id])
    @profile_type.destroy

    respond_to do |format|
      format.html {redirect_to profile_item_path}
      format.json {head :no_content}
    end

  end
end
