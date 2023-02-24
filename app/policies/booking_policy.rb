class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    record.course.user != user
  end

  def update?
    # true
    record.course.user == user
  end
end
