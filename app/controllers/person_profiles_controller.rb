class PersonProfilesController < ApplicationController

  def index
    @person_profiles = PersonProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @person_profiles }
    end
  end

  def show
    @person_profiles = PersonProfile.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @person_profiles }
    end
  end

  def new
    @person_profile = PersonProfile.new
    @person_profile.profile_sub_items.build
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @person_profile }
    end
  end

  def create
    @person_profile = PersonProfile.new(params[:person_profile])

    respond_to do |format|
      if @person_profile.save
        format.html { redirect_to @person_profile, notice: 'Person Profile was successfully created.' }
        format.json { render json: @person_profile, status: :created, location: @person_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @person_profile.errors, status: :unprocessable_entity }
      end
    end
  end



  def edit
    @person_profile = PersonProfile.find(params[:id])
  end

  def update
    @person_profile = PersonProfile.find(params[:id])

    respond_to do |format|
      if @person_profile.update_attributes(params[:person_profile])
        format.html { redirect_to @person_profile, notice: 'Person Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person_profile.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @person_profile = PersonProfile.find(params[:id])
    @person_profile.destroy

    respond_to do |format|
      format.html {redirect_to person_profile_path}
      format.json {head :no_content}
    end

  end

  def getPsub

    @selected_id = ProfileSubType.find_all_by_profile_type_id(params[:psubid])

    respond_to do |format|
      format.js {render :json => @selected_id}
    end

  end

end
