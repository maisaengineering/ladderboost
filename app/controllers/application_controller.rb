class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  protected
 # Below method is used not to render layout for sign up pages
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
 # Below method is used not to render layout for sign up pages

 # add_breadcrumb :index, :root_path

  #If the user authorization fails, a CanCan::AccessDenied exception will be raised. You can catch this like
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end


  #redirect to profile creation page if not exists
  def check_user_profile
    if current_user && current_user.profile.nil?
      redirect_to new_user_profile_path(current_user) ,notice: "#{flash[:notice]} #{t(:profile_notice)}."
    end
  end

  #After user signed redirect to  account page
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
        if resource.is_a?(User)
          my_account_path
        else
          super
        end
  end

end
