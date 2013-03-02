class Users::ProfessionalIndustriesController < ApplicationController
  #load_and_authorize_resource
  before_filter :authenticate_user!
  before_filter :check_user_profile
  before_filter :find_or_build_professional_industry,except: [:index,:create]
  before_filter { @no_sidebar = true }

  def index
    @professional_industries = current_user.professional_industries
  end

  def new
    render :layout => false
  end

  def edit
    render :layout => false
  end

  def create
    @professional_industry = current_user.professional_industries.build(params[:professional_industry])
    respond_to do |format|
      if @professional_industry.save
        format.html{redirect_to  user_professional_industries_path(current_user), notice: 'Professional Industry was successfully.'}
      else
        format.html{render action: "new"}
        format.js
      end
    end
  end

  def update
    #@education = Education.find(params[:education])
    respond_to do |format|
      if @professional_industry.update_attributes(params[:professional_industry])
        format.html{redirect_to  "/my_account", notice: 'Professional Industry was updated successfully.'}
        format.js
      else
        format.html{render action: "edit"}
        format.js
      end
    end
  end

  #def update
  #  if @professional_industry.update_attributes(params[:professional_industry])
  #    redirect_to  user_professional_industries_path(current_user), notice: 'Professional Industry was updated successfully.'
  #  else
  #    render action: "edit"
  #  end
  #end

  private
  def find_or_build_professional_industry
    @professional_industry= current_user.professional_industries.where(id: params[:id]).first || current_user.professional_industries.build
  end

end
