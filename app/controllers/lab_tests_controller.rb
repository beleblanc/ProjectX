class LabTestsController < ApplicationController

  def create
  @lab_test = LabTest.new(params[:lab_test])

    respond_to do |format|
      if @lab_test.save
        format.html {redirect_to @lab_test, notice:"Lab Test Type was successfully created"}
      else
        format.html {render action:"new"}

      end

    end

  end

  def new

  end


end
