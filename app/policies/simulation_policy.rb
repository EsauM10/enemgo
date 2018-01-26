class SimulationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.student?
  end

  def create?
    user.student?
  end

  def finished?
    user.student?
  end

  def answering?
    user.student? && record.user == user && record.doing? && !record.time_expired?
  end
end
