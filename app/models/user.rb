class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum kind: %i[student evaluator admin]


  def is_student?
    self.kind == 0
  end

  def is_admin?
    self.kind == 1
  end

  def is_evaluator?
    self.kind == 2
  end
end
