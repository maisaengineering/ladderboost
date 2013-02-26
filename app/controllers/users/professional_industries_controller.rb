class Users::ProfessionalIndustriesController < ApplicationController
  #load_and_authorize_resource
  before_filter :authenticate_user!
  before_filter :check_user_profile
  before_filter :find_or_build_professional_industry,except: [:index,:create]
  before_filter { @no_sidebar = true }

  def index
    @professional_industries = current_user.professional_industries
  end

  def new ; end

  def edit; end

  def create
    @professional_industry = current_user.professional_industries.build(params[:professional_industry])
    if @professional_industry.save
      redirect_to  user_professional_industries_path(current_user), notice: 'Professional Industry was successfully.'
    else
      render action: "new"
    end
  end

  def update
    if @professional_industry.update_attributes(params[:professional_industry])
      redirect_to  user_professional_industries_path(current_user), notice: 'Professional Industry was updated successfully.'
    else
      render action: "edit"
    end
  end

  private
  def find_or_build_professional_industry
    @professional_industry= current_user.professional_industries.where(id: params[:id]).first || current_user.professional_industries.build
  end

end
