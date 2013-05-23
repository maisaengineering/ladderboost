class ProfessionalIndustry
  include Mongoid::Document
  include Mongoid::Timestamps

  # Fields-------------------------------------------------------------
  field :company_name, type: String
  field :title, type: String
  field :location, type: String
  field :role, type: String
  field :start_date, type: Integer
  field :end_date, type: Integer
  field :description, type: String
  field :professional_headline, type: String
  field :is_current,type: Boolean
  field :aspirations
  field :affiliations

  # Setup Indexes on DB -----------------------------------------------
  # Setup accessible (or protected) attributes for your model----------
  # VALIDATIONS -------------------------------------------------------
  #validates :company_name,:title,:start_date,:end_date,presence: true
  # Constansts Or Class variable---------------------------------------
  # Associations  -----------------------------------------------------
  embedded_in :profile


  # Call Backs---------------------------------------------------------
  # Class Methods Or Scopes -------------------------------------------
  # Instance  Methods --------------------------------------------------
  # Private or Protected Methods----- ----------------------------------

end
