class ProfileItemStepsController < ApplicationController
  include Wicked::Wizard
  steps :step1

  def show
    @profile_item = ProfileItem.find(session[:profile_item_id])
    @profile_sub_item = @profile_item.person_profile_id
    @profile_subtypes = ProfileSubType.find_all_by_profile_type_id(@profile_item.profile_type_id)
    @profile_subtypes.count.times {@profile_item.profile_sub_items.build}
    render_wizard
  end
  
  def update
      @profile_item = ProfileItem.find(session[:profile_item_id])
      @profile_item.update_attributes(params[:profile_item] )
      render_wizard @profile_item
  end  

private
  def redirect_to_finish_wizard
    @profile_item = ProfileItem.find(session[:profile_item_id])
    
    redirect_to @profile_item.person_profile, notice: "Profile Item successfully created"
  end  

end
