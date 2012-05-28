class ProfileSubTypesController < ApplicationController
  def index
    @profile_sub_types = ProfileSubType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_sub_types }
    end
  end

  def show
    @profile_sub_types = ProfileSubType.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_sub_types }
    end
  end

  def new
    @profile_sub_type = ProfileSubType.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_sub_type }
    end
  end

  def create
    @profile_sub_type = ProfileSubType.new(params[:profile_sub_types])

    respond_to do |format|
      if @profile_sub_type.save
        format.html { redirect_to @profile_sub_type, notice: 'Profile Sub Type was successfully created.' }
        format.json { render json: @profile_sub_type, status: :created, location: @profile_sub_type}
      else
        format.html { render action: "new" }
        format.json { render json: @profile_sub_type.errors, status: :unprocessable_entity }
      end
    end
  end



  def edit
    @profile_sub_type = ProfileSubType.find(params[:id])
  end

  def update
    @profile_sub_type = ProfileSubType.find(params[:id])

    respond_to do |format|
      if @profile_sub_type.update_attributes(params[:profile_sub_type])
        format.html { redirect_to @profile_sub_type, notice: 'Profile Sub Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile_sub_type.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @profile_sub_type = ProfileSubType.find(params[:id])
    @profile_sub_type.destroy

    respond_to do |format|
      format.html {redirect_to profile_item_path}
      format.json {head :no_content}
    end

  end
end
