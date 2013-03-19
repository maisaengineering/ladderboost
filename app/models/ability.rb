class Ability
  include CanCan::Ability

  def initialize(user)
    if user.mentor?
      #can :manage ,:all
      can :manage, OrganizationProfile, :admin_email_1 => user.email
      can :manage, OrganizationProfile, :admin_email_2 => user.email
      can :manage, OrganizationProfile, :admin_email_3 => user.email

    elsif user.metee?
      #can :manage, :all
      can :manage, OrganizationProfile, :admin_email_1 => user.email
      can :manage, OrganizationProfile, :admin_email_2 => user.email
      can :manage, OrganizationProfile, :admin_email_3 => user.email

    elsif mentor_and_mentee?
      can :manage, :all
    else # Guest

      can :manage, :all
    end



    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end


end
