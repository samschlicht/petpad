class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      # scope.where(user:)
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def index?
    # record.user == user
    true
  end
end
