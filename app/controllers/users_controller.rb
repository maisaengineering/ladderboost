class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user_profile

  before_filter { @no_sidebar = true }

  def index
    @users = User.all
  end

  #GET account_path(user) or
  def show
    @user = current_user
    @educations = current_user.educations
    @professional_industries = current_user.professional_industries
  end

end
