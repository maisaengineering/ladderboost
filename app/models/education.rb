class Education
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields-------------------------------------------------------------
  field :school_name, type: String
  field :degree, type: String
  field :field_of_study, type: String
  field :education_start_date, type: Integer
  field :education_end_date, type: Integer
  field :activities_societies, type: String
  field :additional_notes, type: String
  # Setup Indexes on DB -----------------------------------------------
  # Setup accessible (or protected) attributes for your model----------
  # VALIDATIONS -------------------------------------------------------
  validates :school_name,presence: true
  # Constansts Or Class variable---------------------------------------
  # Associations  -----------------------------------------------------
  embedded_in :user
  # Call Backs---------------------------------------------------------
  # Class Methods Or Scopes -------------------------------------------
  # Instance  Methods --------------------------------------------------
  # Private or Protected Methods----- ----------------------------------


end
