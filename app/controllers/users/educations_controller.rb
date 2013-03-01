class Users::EducationsController < ApplicationController
  #load_and_authorize_resource
  before_filter :authenticate_user!
  before_filter :check_user_profile
  before_filter :find_or_build_education,except: [:index,:create]
  before_filter { @no_sidebar = true }



  def index
    @educations = current_user.educations
  end

  def new
    render :layout => false
  end

  def edit; end

  def create
    @education = current_user.educations.build(params[:education])
    respond_to do |format|
      if @education.save
       format.html{redirect_to  "/my_account", notice: 'Education was successfully.'}
        format.js
      else
        format.html{render action: "new"}
        format.js
      end
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
