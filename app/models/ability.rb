# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    case user.role
    when 'admin'
      can :manage, :all
    when 'staff'
      can :read, Issue
      can :update, Issue
    when 'reporter'
      can :create, Issue
      can :read, Issue, reported_by: user.id
      can :update, Issue, reported_by: user.id
      can :destroy, Issue, reported_by: user.id
    end
  end
end
