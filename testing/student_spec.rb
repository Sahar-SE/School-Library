require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new(0o01, 18, true, 'student_name')
  end

  describe 'number_of_age' do
    it 'should be the same age' do
      expect(@student.age).to eql 18
    end
  end

  describe 'parent_permission' do
    it 'should return a parent permission' do
      expect(@student.parent_permission).to eql true
    end
  end

  describe '#classroom' do
    it 'checks the student classroom' do
      classroom1 = Classroom.new('CS456')
      @student.classroom = classroom1
      expect(@student.classroom.label).to eql 'CS456'
    end
  end

  describe 'student plays hooky' do
    it "it should return ¯\(ツ)/¯" do
      expect(@student.play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end
