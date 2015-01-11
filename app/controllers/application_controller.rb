class ApplicationController < ActionController::Base

  layout :layout_by_resource
  before_action :store_return_to

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  def after_sign_in_path_for(resource)
    session.delete(:return_to) || root_path
  end

  #def after_sign_up_path_for(resource)
    #session.delete(:return_to) || root_path
  #end

  def after_sign_out_path_for(resource)
    request.referer || root_path
  end

  def store_return_to
    session[:return_to] = request.url unless request.url =~ /users\/sign_in/
  end
end
