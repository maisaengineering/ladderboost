class Users::EducationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user_profile

  before_filter { @no_sidebar = true }

  def index
    @educations = current_user.educations
  end

  def new
    @education = current_user.educations.build
  end

  def create
    @education = current_user.educations.build(params[:education])
    if @education.save
      redirect_to  user_educations_path(current_user), notice: 'Education was successfully.'
    else
      render action: "new"
    end
  end

  def edit

  end


end
