module Constraints
  class RestrictedUserKind
    def self.matches?(request)
      [:student, :evaluator, :admin].include? request.params[:user_kind].to_sym
    end
  end
end
