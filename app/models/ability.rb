class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    can :read, Post
    return unless user.present?

    can :destroy, Post, author: user
    can :destroy, Comment, author: user
    can :create, Post, author: user
    can :create, Like
    can :create, Comment
    return unless user.admin?

    can :destroy, Post
    can :destroy, Comment
  end
end
