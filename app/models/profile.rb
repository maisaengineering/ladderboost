class Profile
  #require 'carrierwave/orm/mongoid'
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Paperclip
  #include Mongoid::CarrierWave


  # Fields-----------------------------------------------------------
  field :first_name
  field :last_name
  field :nickname
  field :professional_headline
  field :phone_number
  field :birth_day
  field :gender
  field :role

  #address
  field :location
  field :city
  field :state
  field :country
  field :zip_code
  field :industry

  #
  field :interests

  # image
  field :image, type: String
  mount_uploader :image, ImageUploader

  # Setup Indexes on DB -----------------------------------------------
  index({ first_name: 1 },{background: true})
  index({ last_name: 1 },{background: true})
  # Setup accessible (or protected) attributes for your model----------
  attr_accessor :roles
  #has_mongoid_attached_file :avatar, styles: {medium: "100x100>",
  #                                            small: "25x25>",
  #                                            large: "200x200>"},
  #                          default_url: '/assets/avatars/:style/missing.png',
  #                          url: "/avatars/:id/:style/:basename.:extension",
  #                          path: ":rails_root/public/avatars/:id/:style/:basename.:extension"
  # VALIDATIONS -------------------------------------------------------
  validates :first_name,:last_name, presence: true
  #validates_attachment :avatar,
  #                     :content_type => { :content_type => ['image/jpeg', 'image/png','image/jpg','image/gif'] },
  #                     :size => { :in => 0..5.megabytes }
  validates :birth_day, presence: true

  validate :roles_if_not_assigned
  # Constants Or Class variable---------------------------------------

  # Associations  -----------------------------------------------------

  embedded_in :user

  # Call Backs---------------------------------------------------------
  before_validation { |record| roles.reject!(&:blank?) if roles.present? }
  after_save :assign_role

  before_save :titleize_attributes
  # Class Methods Or Scopes -------------------------------------------

  # Instance  Methods --------------------------------------------------
  def roles_if_not_assigned
    #raise self.user.inspect
    errors.add(:roles,"can't be blank") if self.user.roles.blank? and self.roles.blank?
  end

  def assign_role
    #update role of the user if not assigned already(signup via omniauth)
    user.update_attribute(:roles, self.roles) if self.roles.present? and user.roles.blank?
  end

  def titleize_attributes
    %w(first_name last_name).each do |attr|
      self.send("#{attr}=", self.send(attr).titleize)
    end
  end

  def name
    "#{first_name} #{last_name}"
  end
  # Private or Protected Methods----- ----------------------------------




end
