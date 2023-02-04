class Petsitter::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.joins(:pad).where(pad: { user: user })
    end
  end

  def index?
    true
  end

  def update?
    record.user == user
  end

  def edit?
    true
  end

end
