class WaitListsController < ApplicationController
  # GET /waitlist
  # GET /waitlist.json
  def index
    @waitlist = WaitList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @waitlist }
    end
  end

  # GET /waitlist/1
  # GET /waitlist/1.json
  def show
    @waitlist = WaitList.find(params[:id])
    @person = Person.find(@waitlist.people_id)
    @profile = Profile.find_by_person_id(@waitlist.people_id)

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @waitlist }
    end
  end

  # GET /waitlist/new
  # GET /waitlist/new.json
  def new
    @waitlist = WaitList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @waitlist }
    end
  end

  # GET /waitlist/1/edit
  def edit
    @waitlist = WaitList.find(params[:id])
  end

  # POST /waitlist
  # POST /waitlist.json
  def create
    @waitlist = WaitList.new(params[:wait_list])

    respond_to do |format|
      if @waitlist.save
        format.html { redirect_to people_path, notice: 'Patient was successfully checked-in.' }
        format.json { render json: @waitlist, status: :created, location: @waitlist }

      else
        format.html { render action: "new" }
        format.json { render json: @waitlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /waitlist/1
  # PUT /waitlist/1.json
  def update
    @waitlist = WaitList.find(params[:id])

    respond_to do |format|
      if @waitlist.update_attributes(params[:waitlist])
        format.html { redirect_to @waitlist, notice: 'Waiting Patient info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @waitlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waitlist/1
  # DELETE /wailtlist/1.json
  def destroy
    @waitlist = WaitList.find(params[:id])
    @waitlist.destroy

    respond_to do |format|
      format.html { redirect_to wait_lists_path }
      format.json { head :no_content }
    end
  end
end
