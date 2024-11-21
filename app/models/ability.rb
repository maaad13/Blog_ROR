class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article

    if user.present?
      can :manage, Comment
    end

    if user && user.has_role?(:audience)
      can :manage, Comment
    end

    if user && user.has_role?(:admin)
      can :manage, Article
      can :manage, Comment
    end

  end

end
