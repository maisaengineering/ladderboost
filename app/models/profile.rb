class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  # Fields-----------------------------------------------------------
  field :first_name
  field :last_name
  field :city
  field :state
  field :country

  # Setup Indexes on DB -----------------------------------------------
  index({ first_name: 1 },{background: true})
  index({ last_name: 1 },{background: true})
  # Setup accessible (or protected) attributes for your model----------
  has_mongoid_attached_file :avatar, styles: {medium: "100x100>",
                                              small: "25x25>",
                                              large: "200x200>"},
                            default_url: ActionController::Base.helpers.asset_path('avatars/:style/missing.png'),
                            url: "/avatars/:id/:style/:basename.:extension",
                            path: ":rails_root/public/avatars/:id/:style/:basename.:extension"
  # VALIDATIONS -------------------------------------------------------
  validates :first_name,:last_name, presence: true
  validates_attachment :avatar, presence: true,
                       :content_type => { :content_type => ['image/jpeg', 'image/png','image/jpg','image/gif'] },
                       :size => { :in => 0..5.megabytes }

  # Constansts Or Class variable---------------------------------------
  # Associations  -----------------------------------------------------

  embedded_in :user

  # Call Backs---------------------------------------------------------
  # Class Methods Or Scopes -------------------------------------------
  # Instance  Methods --------------------------------------------------
  def name
    "#{first_name} #{last_name}"
  end
  # Private or Protected Methods----- ----------------------------------


end
