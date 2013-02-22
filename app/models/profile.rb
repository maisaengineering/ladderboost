class Profile
  include Mongoid::Document
  include Mongoid::Timestamps

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
  embedded_in :user

  # Call Backs---------------------------------------------------------
  # Class Methods Or Scopes -------------------------------------------
  # Instance  Methods --------------------------------------------------
  def name
    "#{first_name} #{last_name}"
  end
  # Private or Protected Methods----- ----------------------------------


end
