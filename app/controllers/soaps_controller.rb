class SoapsController < ApplicationController

  def create
    @soap = Soap.new(params[:soap])

    if @soap.save

    else

    end

  end

  def update
    @soap = Soap.find(params[:id])
  end

  def new
    @soap = Soap.new

  end



end