require_relative 'person'
require_relative 'classroom'
class Student < Person
  def initialize(age, parent_permission, classroom, name = 'unknown')
    super(age, name, parent_permission: parent_permission)
    # @classroom = classroom.new(classroom)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
