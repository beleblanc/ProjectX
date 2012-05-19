module DiagnosesHelper
  def find_diagnosis
    @diagnosis = Diagnosis.find(params[:id])
  end

end
