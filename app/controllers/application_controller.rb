class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_talker!,except: [:top], unless: :admin_signed_in?
  before_action :authenticate_admin!,except: [:top], unless: :talker_signed_in?

  
  
  def after_sign_in_path_for(resource)
    if resource_name == :talker
      talker_path(resource)
    elsif resource_name == :admin
       admin_homes_top_path
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  
  

  protected
  def authenticate_admin
    if @admin == nil
      redirect_to("admin/sign_in")
    end
  end
      
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
