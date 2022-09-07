class Classroom
  attr_accessor :lable

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
