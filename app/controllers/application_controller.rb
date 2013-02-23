class ApplicationController < ActionController::Base
  protect_from_forgery

  add_breadcrumb :index, :root_path


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
