class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    # user ||= User.new # guest user (not logged in)
    # if user.present?
    #       if user.admin?
    #         can :manage, :all
    #       else
    #         can :read, :all
    #         can :manage, Post, author_id: user.id
    #       end
    # end

    # The following definition is better than above
    # cf https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities%3A-Best-Practices#give-permissions-dont-take-them-away
    can :read, :all   # start by defining rules for all users, also not logged ones
    return unless user.present?
    puts 'hey user'   # greets every logged in user, but user controller will not confirm user class if it's an admin
    can :manage, Post, author_id: user.id # if the user is logged in can manage it's own posts
    return unless user.admin?  # check for admin? in admin_user controller
    puts 'hey admin'  # if admin_user controller has confirmed it belongs to admin class
    can :manage, :all # finally we give all remaining permissions only to the admins
  
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
