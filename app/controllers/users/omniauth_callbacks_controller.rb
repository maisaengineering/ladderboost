class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  skip_before_filter :verify_authenticity_token, :only => [:google]
  before_filter { session.delete(:social_login_data) if session[:social_login_data]} #clear the session data}

  def facebook
    social_login(request.env['omniauth.auth'], current_user,"Facebook")
  end

  def linkedin
    social_login(request.env['omniauth.auth'], current_user,"Linkedin")
  end

  def google
    social_login(request.env['omniauth.auth'], current_user,"Google")
  end

  def twitter
    social_login(request.env['omniauth.auth'], current_user,"Twitter")
  end

  def social_login(data,user,kind)
    @user = User.send(:"find_for_#{kind.downcase}_oauth",data,user)
    session[:social_login_data] = data.info
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: kind
      sign_in_and_redirect @user, event: :authentication
    else
      flash.now[:notice] = "#{t("devise.omniauth_callbacks.success",kind: kind)}.#{t(:profile_fill_notice)}"
    end
  end


  def passthru
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
    # Or alternatively,
    # raise ActionController::RoutingError.new('Not Found')
  end


end
