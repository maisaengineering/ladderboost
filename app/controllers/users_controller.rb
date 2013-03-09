class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user_profile

  before_filter { @no_sidebar = true }

  def index
    @users = User.all
  end

  def follow
    mentor = @current_user._id
     #mentee = User.where(:_id => params[:id])
     mentee = params[:id]
     @ment = User.new.sample_method(mentor, mentee)
    redirect_to("/my_account")
  end

  #GET account_path(user) or
  def show
    @user = current_user
    @educations = current_user.educations
    @professional_industries = current_user.professional_industries
  end

end
