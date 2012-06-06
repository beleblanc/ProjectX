class PersonProfileStepsController < ApplicationController
  include Wicked::Wizard
  steps :step1, :step2

  def show
    render_wizard
  end

end
