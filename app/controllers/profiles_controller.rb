class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_or_build_profile,except: [:create]

  # GET /users/:user_id/profile
  # GET /users/:user_id/profile.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /users/:user_id/profile/new
  # GET /users/:user_id/profile/new.json
  def new
    if session[:social_login_data]
      data = session[:social_login_data]
      @profile.assign_attributes(first_name: data.try(:first_name),last_name: data.try(:last_name),
                                 nickname: data.try(:nickname),location: data.try(:location),
                                 phone_number: data.try(:phone),professional_headline: data.try(:headline))

    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /users/:user_id/profile/edit
  def edit; end

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
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to my_account_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:user_id/profile
  # DELETE /users/:user_id/profile.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
  def find_or_build_profile
    @profile = current_user.profile || current_user.build_profile
  end
end
