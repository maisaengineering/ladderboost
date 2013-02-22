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
  # VALIDATIONS -------------------------------------------------------
  validates :first_name,:last_name, presence: true

  # Constansts Or Class variable---------------------------------------
  # Associations  -----------------------------------------------------
  has_mongoid_attached_file :avatar, styles: {medium: "100x100>",
                                              small: "25x25>",
                                              large: "200x200>"},
                            default_url: ActionController::Base.helpers.asset_path('avatars/:style/missing.png'),
                            url: "/avatars/:id/:style/:basename.:extension",
                            path: ":rails_root/public/avatars/:id/:style/:basename.:extension"
  embedded_in :user

  # Call Backs---------------------------------------------------------
  # Class Methods Or Scopes -------------------------------------------
  # Instance  Methods --------------------------------------------------
  def name
    "#{first_name} #{last_name}"
  end
  # Private or Protected Methods----- ----------------------------------


end
