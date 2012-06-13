class ProfileItemsController < ApplicationController

  def index
    @profile_items = ProfileItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_items }
    end
  end

  def show
    @profile_items = ProfileItem.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_items }
    end
  end

  def new
    @profile_item = ProfileItem.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_item }
    end
  end

  def create
    @profile_item = ProfileItem.new(params[:profile_item])

    respond_to do |format|
      if @profile_item.save
        session[:profile_item_id] = @profile_item.id

        format.html { redirect_to profile_item_steps_path }
        format.json { render json: @profile_item, status: :created, location: @profile_item}

      else
        format.html { render action: "new" }
        format.json { render json: @profile_item.errors, status: :unprocessable_entity }
      end
    end
  end



  def edit
    @profile_item = ProfileItem.find(params[:id])
  end

  def update
    @profile_item = ProfileItem.find(params[:id])

    respond_to do |format|
      if @profile_item.update_attributes(params[:profile_item])
        format.html { redirect_to @profile_item, notice: 'Profile Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile_item.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @profile_item = ProfileItem.find(params[:id])
    @profile_item.destroy

    respond_to do |format|
      format.html {redirect_to profile_item_path}
      format.json {head :no_content}
    end

  end
end
