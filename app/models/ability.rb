# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Grant full access to admins
    can :manage, :all if user.role == 'Admin'

    # Grant basic management for regular users (Post, Subscription, Comment)
    can :manage, [Post, Subscription] if user.role == 'User'

    # Define specific logic for comment deletion (only user-owned)
    can :manage, Comment, user_id: user.id
    # return unless user.role == 'User'

    # can :manage, Post

    # can :manage, Post do |post|
    #   # Admins can always delete any comment
    #   if user.role == 'Admin'
    #     true
    #   else
    #     # Regular users can only delete their own comments
    #     post.comments.where(user_id: current_user.id).destroyable?
    #   end
    # end

    
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
