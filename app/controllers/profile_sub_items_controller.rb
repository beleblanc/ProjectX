class ProfileSubItemsController < ApplicationController
  def index
    @profile_sub_items = ProfileSubItem.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @profile_sub_items }
    end
  end

  def show
    @profile_sub_items = ProfileSubItem.find(params[:id])

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @profile_sub_items }
    end
  end

  def new
    @profile_sub_item = ProfileSubItem.new

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @profile_sub_item }
    end
  end

  def create
    @profile_sub_item = ProfileSubItem.new(params[:profile_sub_item])

    respond_to do |format|
      if @profile_sub_item.save
        format.html { redirect_to @profile_sub_item, notice: 'Profile Sub Item was successfully created.' }
        format.json { render json: @profile_sub_item, status: :created, location: @profile_sub_item}
      else
        format.html { render action: "new" }
        format.json { render json: @profile_sub_item.errors, status: :unprocessable_entity }
      end
    end
  end



  def edit
    @profile_sub_item = ProfileSubItem.find(params[:id])
  end

  def update
    @profile_sub_item = ProfileSubItem.find(params[:id])

    respond_to do |format|
      if @profile_sub_item.update_attributes(params[:profile_sub_items])
        format.html { redirect_to @profile_sub_item, notice: 'Profile  Sub Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile_sub_item.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @profile_sub_item = ProfileSubItem.find(params[:id])
    @profile_sub_item.destroy

    respond_to do |format|
      format.html {redirect_to profile_item_path}
      format.json {head :no_content}
    end

  end
end
