class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user_profile

  before_filter  {@no_sidebar = true}


  def index
    @users = User.all
  end

  def follow
    @no_sidebar = false
   user = User.find(params[:id])
   current_user.follow(user)
    redirect_to("/public_profile")

  end

  def unfollow
    @no_sidebar = false
    user = User.find(params[:id])
    current_user.unfollow(user)
    redirect_to("/public_profile")
  end

  def tokenizer

    @authors = User.all

    respond_to do |format|
      format.html

      format.json { render :json => @authors }
    end
  end

  #def check_follow(check,current_user)
  #  puts  "-----------------------"
  #  current_user.follower_of?(check)
  #  puts "--------------------------"
  #
  #end

  #GET account_path(user) or
  def show
    @activities = PublicActivity::Activity.all
    #raise @activities.inspect
    @user = current_user
    @educations = current_user.educations
    @professional_industries = current_user.professional_industries
    @users = User.all

    @followers =User.followers_of(current_user)
    @following = User.followees_of(current_user)

    #@no_of_followers = current_user.followers_count


  end

  def public_profile
    @no_sidebar = false
    @user = current_user
    @educations = current_user.educations
    @professional_industries = current_user.professional_industries
    @users = User.all
   # @users.delete current_user
   # @users = User.without_user(current_user)
    #@users = User.find(:all, :conditions => ["id!= ?", current_user.id])
    @followers =User.followers_of(current_user)
    @following = User.followees_of(current_user)
  end

end
