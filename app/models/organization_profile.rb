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
  field :admin_email_1
  field :admin_email_2
  field :admin_email_3
  mount_uploader :upload_logo, ImageUploader

  # VALIDATIONS -------------------------------------------------------

  validates :name, :location, :mission, :organization_administrator, :admin_email_1, presence: true
  #validates_uniqueness_of :admin_email_1
  validates :admin_email_1, :admin_email_2, :admin_email_3,
            :allow_blank => true,
            :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }


end
