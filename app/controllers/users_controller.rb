class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user_profile

  before_filter { @no_sidebar = true }

  def index
    @users = User.all
  end

  def follow
   user = User.find(params[:id])
   current_user.follow(user)
    redirect_to("/my_account")

  end

  def unfollow
    user = User.find(params[:id])
    current_user.unfollow(user)
    redirect_to("/my_account")
  end

  #def check_follow(check,current_user)
  #  puts  "-----------------------"
  #  current_user.follower_of?(check)
  #  puts "--------------------------"
  #
  #end

  #GET account_path(user) or
  def show
    @user = current_user
    @educations = current_user.educations
    @professional_industries = current_user.professional_industries
    @users = User.all
    @followers =User.followers_of(current_user)
    @following = User.followees_of(current_user)

    #@no_of_followers = current_user.followers_count


  end

end
