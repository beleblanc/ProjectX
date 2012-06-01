class DependenciesController < ApplicationController
  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @dependency = Dependency.find(params[:id])
    @dependency.destroy

    respond_to do |format|
      format.html {redirect_to person_path(@dependency.person)}

    end



  end
end
