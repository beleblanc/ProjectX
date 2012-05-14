class VitalsController < ApplicationController

  def create
    @vital = Vital.new(params[:vital])

    if @vital.save

    else

    end

  end

  def update
    @vital = Vital.find(params[:id])
  end

  def new
    @vital = Vital.new

  end



end