class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_or_build_profile,except: [:create]


  # GET /users/:user_id/profile
  # GET /users/:user_id/profile.json
  def show; end

  # GET /users/:user_id/profile/new
  # GET /users/:user_id/profile/new.json
  def new
    @professional_industry = ProfessionalIndustry.new
    if session[:social_login_data]
      data = session[:social_login_data]
      @profile.assign_attributes(first_name: data.try(:first_name),last_name: data.try(:last_name),
                                 nickname: data.try(:nickname),location: data.try(:location),
                                 phone_number: data.try(:phone),professional_headline: data.try(:headline))

    end
  end

  # GET /users/:user_id/profile/edit
    def edit
      @professional_industry = ProfessionalIndustry.new

   end

  #POST /users/:user_id/profile
  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      redirect_to my_account_path, notice: 'Profile was successfully saved.'
    else
      render action: "new"
    end
  end

  # PUT /users/:user_id/profile
  # PUT /users/:user_id/profile.json

  def update
    #@education = Education.find(params[:education])
    respond_to do |format|
      if @profile.update_attributes!(params[:profile])
        @profile.create_activity :update, firstname: @profile.first_name
        format.html {redirect_to my_account_path, notice: 'Profile was successfully updated.'}
      else
        format.html{render action: "edit"}
        format.js
      end
    end
  end

  #def update
  #  if @profile.update_attributes!(params[:profile])
  #    redirect_to my_account_path, notice: 'Profile was successfully updated.'
  #  else
  #    format.html{render action: "edit"}
  #    format.js
  #  end
  #end


# DELETE /users/:user_id/profile
# DELETE /users/:user_id/profile.json
  def destroy
    @profile.destroy
    redirect_to root_url
  end

  private
  def find_or_build_profile
    @profile = current_user.profile || current_user.build_profile
  end
end
