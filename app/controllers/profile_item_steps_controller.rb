class ProfileItemStepsController < ApplicationController
  include Wicked::Wizard
  steps :step1, :step2

  def show
    @profile_item = ProfileItem.find(session[:profile_item_id])
    @profile_sub_item = @profile_item.person_profile_id
    @profile_subtypes = ProfileSubType.find_all_by_profile_type_id(@profile_item.profile_type_id)
    render_wizard
  end

end
