class Ability
  include CanCan::Ability

  def initialize(user)
    if user.editor?
      can :manage, [Provider, Ticket, Bank], user_id: user.id
    elsif user.admin?
      can :manage, :all
    else
      can :read, [Provider, Ticket, Bank]
    end
  end
end
