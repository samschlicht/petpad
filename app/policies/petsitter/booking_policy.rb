class Petsitter::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.joins(:pad).where(pad: { user: user })
    end
  end
end
