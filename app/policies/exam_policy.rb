class ExamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.official
      else
        scope.official.or scope.custom(user)
      end
    end
  end

  def index?
    user.admin? || user.student?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def show?
    user.admin? || (user.student? && record.user == user)
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def generate?
    user.student?
  end

  def permitted_attributes_for_generate
    [:areas, :kind_questions]
  end

  def permitted_attributes
    if user.admin?
      [:year, :kind, :title, question_ids:[]]
    else
      [:id]
    end
  end
end
