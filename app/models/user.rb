class User
  include Mongoid::Document
  include Mongoid::Timestamps

  include Mongo::Followable::Followed
  include Mongo::Followable::Follower

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time
  field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String



  # Fields-------------------------------------------------------------
  field :name, :type => String
  field :roles ,:type=>Array
  ##Omniauthable
  field :provider
  field :facebook_uid
  field :linkedin_uid

  # Setup Indexes on DB------------------------------------------------
  #run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

  # Setup accessible (or protected) attributes for your model----------
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :created_at, :updated_at ,
                  :provider,:facebook_uid,:linkedin_uid ,:roles

  # VALIDATIONS -------------------------------------------------------
  #validates_presence_of :name

  #skip if logged in from omniauth and prompt it to fill in profile
  validates :roles ,presence: true,if: Proc.new { |r| r.provider.nil? }
  # Constansts Or Class variable---------------------------------------
  ROLES = %w(Mentor Mentee)

  # Associations  -----------------------------------------------------
  embeds_one :profile
  embeds_many :educations
  embeds_many :professional_industries

  # Call Backs---------------------------------------------------------
  #collection checkboxes returning empty element ['mentor',''] remove that
  #we can fix this in Rails 4 by issuing this  input_hidden: true   in form
  before_validation { |record| roles.reject!(&:blank?) if roles.present? }

  # Class Methods Or Scopes -------------------------------------------
  #Omniauth instance methods
  class << self
    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"]
        end
      end
    end

    %w(facebook linkedin google).each do |social|
      define_method(:"find_for_#{social}_oauth") do |access_token, signed_in_resource = nil|
        email = access_token.provider.eql?('facebook') ? access_token.extra.raw_info.email : access_token.info.email
        if user = where(email: email).first
          user.confirm! unless user.confirmed?
          user
        else # Create a user with a stub password.
          user = User.new(email: email, password: Devise.friendly_token[0,20], provider: social)
          user.send("#{social}_uid=",access_token.extra.raw_info.try(:id)) unless social.eql?('google')
          user.skip_confirmation!
          user.save!
          user
        end
      end
    end


  end

# Instance  Methods --------------------------------------------------

#generates instance methods like  user.mentor? user.mentee?
  ROLES.each do |role|
    define_method "#{role.downcase}?" do
      self.roles.include?(role)
    end
  end
#TODO generate this method dynamically
  def mentor_and_mentee?
    self.roles.eql? %w(Mentor Mentee)
  end

  def self.no_of_users_followers(lists)

    @users =  User.find(lists)

       @users.followers_count


  end

  def self.no_of_users_following(lists)
    @users =  User.find(lists)

    @users.followees_count


  end



# Private or Protected Methods----- ----------------------------------
end
