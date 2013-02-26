class Users::EducationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user_profile
  before_filter :find_education,except: [:create]

  before_filter { @no_sidebar = true }

  def index
    @educations = current_user.educations
  end

  def new ; end

  def edit; end

  def create
    @education = current_user.educations.build(params[:education])
    if @education.save
      redirect_to  user_educations_path(current_user), notice: 'Education was successfully.'
    else
      render action: "new"
    end
  end

  def update
    if @education.update_attributes(params[:education])
      redirect_to  user_educations_path(current_user), notice: 'Education was updated successfully.'
    else
      render action: "edit"
    end
  end

private
  def find_or_build_education
    @education = current_user.educations.where(id: params[:id]).first || current_user.educations.build
  end


end
