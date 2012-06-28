class ApplicationController < ActionController::Base
  protect_from_forgery
  #check_authorization :unless => :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def current_ability
      @current_ability ||= Ability.new(current_user)
    end

end
