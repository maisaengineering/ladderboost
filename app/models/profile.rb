class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  # Fields-----------------------------------------------------------
  field :first_name
  field :last_name
  field :nickname
  field :professional_headline
  field :phone_number
  field :birth_day
  field :gender

  #address
  field :location
  field :city
  field :state
  field :country
  field :zip_code
  field :industry

  #
  field :interests

  # Setup Indexes on DB -----------------------------------------------
  index({ first_name: 1 },{background: true})
  index({ last_name: 1 },{background: true})
  # Setup accessible (or protected) attributes for your model----------
  attr_accessor :role
  has_mongoid_attached_file :avatar, styles: {medium: "100x100>",
                                              small: "25x25>",
                                              large: "200x200>"},
                            default_url: '/assets/avatars/:style/missing.png',
                            url: "/avatars/:id/:style/:basename.:extension",
                            path: ":rails_root/public/avatars/:id/:style/:basename.:extension"
  # VALIDATIONS -------------------------------------------------------
  validates :first_name,:last_name, presence: true
  validates :role,presence: true ,if: Proc.new{|r| r.new_record? }
  validates_attachment :avatar,
                       :content_type => { :content_type => ['image/jpeg', 'image/png','image/jpg','image/gif'] },
                       :size => { :in => 0..5.megabytes }
  validates :birth_day, presence: true

  # Constants Or Class variable---------------------------------------

  # Associations  -----------------------------------------------------

  embedded_in :user

  # Call Backs---------------------------------------------------------
  after_save :assign_role

  before_save :titleize_attributes
  # Class Methods Or Scopes -------------------------------------------

  # Instance  Methods --------------------------------------------------
  def assign_role
    #update role of the user if not assigned already(signup via omniauth)
    user.update_attribute(:role, self.role) if self.role.present? and user.role.nil?
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
