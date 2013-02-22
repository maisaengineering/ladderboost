class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  #GET account_path(user) or
  def show
    @user = current_user
  end

end
