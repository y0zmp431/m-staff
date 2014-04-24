class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.is? :admin
         can :manage, :all
			 elsif user.is? :moderator
				 can :manage, Article
				 can :manage, Contact 
         can :read, :all
			 elsif user.is? :writer
				 can :manage, Article
				 can :manage, Atricle 
				 can :manage, Contact 
         can :read, :all
			 elsif user.is? :user
				 can :read, Article, :published => true
				 cannot :read_disabled, Article
				 cannot :read, Article, :published => false 
				 can [:read, :update], User, :id => user.id 
				 can :read, Contact 
			 else
				 #can :read, Article
				 can :read, Article, :published => true 
				 cannot :read, Article, :published => false 
				 can :create, User
				 can :recovery, User
				 can :read, Contact 
       end
       #cannot :read, Banner, Banner.where(:disabled => true) do |banner|
       #  banner.disabled?
       #end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
