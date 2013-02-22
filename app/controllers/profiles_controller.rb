class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  # GET /users/:user_id/profile
  # GET /users/:user_id/profile.json
  def show
    @profile = current_user.profile
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /users/:user_id/profile/new
  # GET /users/:user_id/profile/new.json
  def new
    @profile = current_user.build_profile

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /users/:user_id/profile/edit
  def edit
    @profile = current_user.profile
  end

  #POST /users/:user_id/profile
  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      redirect_to user_profile_path(current_user), notice: 'Profile was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /users/:user_id/profile
  # PUT /users/:user_id/profile.json

  def update
    @profile = current_user.profile
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to user_profile_path(current_user), notice: 'Profile was successfully updated.' }
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
    @profile = current_user.profile
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end
