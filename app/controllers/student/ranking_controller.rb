class Student::RankingController < ApplicationController
  layout 'dashboard'

  def index
    @students = User.students
  end
end
