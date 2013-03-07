class OrganizationProfile
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields-----------------------------------------------------------
  field :name
  field :location
  field :mission
  field :summary
  field :organization_administrator
  field :upload_logo
  mount_uploader :upload_logo, ImageUploader

  # VALIDATIONS -------------------------------------------------------

  validates :name, :location, :mission, :organization_administrator, presence: true


end
