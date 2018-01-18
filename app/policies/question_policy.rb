class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.student?
        scope.where(user: user).active
      else
        scope.active
      end
    end
  end

  def show?
    return true if user.admin? || user.evaluator?
    record.user == user
  end
  def edit?
    user.admin? || user.evaluator?
  end

  def update?
    user.admin? || user.evaluator?
  end

  def destroy?
    user.admin? || user.evaluator?
  end

end
