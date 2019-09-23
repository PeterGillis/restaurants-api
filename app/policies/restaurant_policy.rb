class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # only restauarnt owners can update this
    # record
    # user
    record.user == user
  end

  def create?
    # Any logged in user can create a restaurant
    # Any logged in user who is not disabled can
    # create a restaurant (i.e as long as they dont ahve
    # 'disabled: true' next to their database entry)
    !user.nil?
  end

  def destroy?
    update?
  end
end
