class PeopleController < ApplicationController

  before_filter :destroy_dependency, :except => [:new,:create ]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    @waitlist = @person.wait_lists.build
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    if params.has_key?:person_id
      @dependency = true
      session[:person_id] = params[:person_id]

    end

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    @person.build_person_profile
    @person.person_medical_aids.new(:join_date=>Date.today, :medical_aid_plan_id => MedicalAidPlan.find_by_name("Cash").id)
    respond_to do |format|
      if @person.save
        unless session[:person_id].nil?
          @person.create_dependency(session[:person_id])
          session[:person_id] = nil
        end
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

private

def destroy_dependency
    session[:person_id] = nil

end

end
