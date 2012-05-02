class ProfileSubValuesController < ApplicationController
  # GET /ProfileSubValues
  # GET /ProfileSubValues.json
  def index
    @ProfileSubValues = ProfileSubValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ProfileSubValues }
    end
  end

  # GET /ProfileSubValues/1
  # GET /ProfileSubValues/1.json
  def show
    @ProfileSubValue = ProfileSubValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @ProfileSubValue }
    end
  end

  # GET /ProfileSubValues/new
  # GET /ProfileSubValues/new.json
  def new
    @ProfileSubValue = ProfileSubValue.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @ProfileSubValue }
    end
  end

  # GET /ProfileSubValues/1/edit
  def edit
    @ProfileSubValue = ProfileSubValue.find(params[:id])
  end

  # POST /ProfileSubValues
  # POST /ProfileSubValues.json
  def create
    @ProfileSubValue = ProfileSubValue.new(params[:ProfileSubValue])

    respond_to do |format|
      if @ProfileSubValue.save
        format.html { redirect_to @ProfileSubValue, notice: 'ProfileSubValue was successfully created.' }
        format.json { render json: @ProfileSubValue, status: :created, location: @ProfileSubValue }
      else
        format.html { render action: "new" }
        format.json { render json: @ProfileSubValue.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /ProfileSubValues/1
  # PUT /ProfileSubValues/1.json
  def update
    @ProfileSubValue = ProfileSubValue.find(params[:id])

    respond_to do |format|
      if @ProfileSubValue.update_attributes(params[:ProfileSubValue])
        format.html { redirect_to @ProfileSubValue, notice: 'ProfileSubValue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ProfileSubValue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ProfileSubValues/1
  # DELETE /ProfileSubValues/1.json
  def destroy
    @ProfileSubValue = ProfileSubValue.find(params[:id])
    @ProfileSubValue.destroy

    respond_to do |format|
      format.html { redirect_to ProfileSubValues_url }
      format.json { head :no_content }
    end
  end
end
