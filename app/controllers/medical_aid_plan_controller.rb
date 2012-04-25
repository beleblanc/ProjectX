class MedicalAidPlanController < ApplicationController

  def destroy
    @medical_aid_plan = MedicalAidPlan.find(params[:id])
         @medical_aid_plan.destroy

         respond_to do |format|
           format.html {redirect_to medical_aid_path(@medical_aid_plan.medical_aids_id)}
           format.json {head :no_content}
        end
  end
end
