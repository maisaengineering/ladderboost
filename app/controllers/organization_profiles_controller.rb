class OrganizationProfilesController < ApplicationController
  # GET /organization_profiles
  # GET /organization_profiles.json
  def index
    @organization_profiles = OrganizationProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organization_profiles }
    end
  end

  # GET /organization_profiles/1
  # GET /organization_profiles/1.json
  def show
    @organization_profile = OrganizationProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization_profile }
    end
  end

  # GET /organization_profiles/new
  # GET /organization_profiles/new.json
  def new
    @organization_profile = OrganizationProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization_profile }
    end
  end

  # GET /organization_profiles/1/edit
  def edit
    @organization_profile = OrganizationProfile.find(params[:id])
  end

  # POST /organization_profiles
  # POST /organization_profiles.json
  def create
    @organization_profile = OrganizationProfile.new(params[:organization_profile])

    respond_to do |format|
      if @organization_profile.save
        format.html { redirect_to @organization_profile, notice: 'Organization profile was successfully created.' }
        format.json { render json: @organization_profile, status: :created, location: @organization_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @organization_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organization_profiles/1
  # PUT /organization_profiles/1.json
  def update
    @organization_profile = OrganizationProfile.find(params[:id])

    respond_to do |format|
      if @organization_profile.update_attributes(params[:organization_profile])
        format.html { redirect_to @organization_profile, notice: 'Organization profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organization_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_profiles/1
  # DELETE /organization_profiles/1.json
  def destroy
    @organization_profile = OrganizationProfile.find(params[:id])
    @organization_profile.destroy

    respond_to do |format|
      format.html { redirect_to organization_profiles_url }
      format.json { head :no_content }
    end
  end
end
