require_relative '../classroom'
require_relative '../student'

describe '#classroom' do
  cr = Classroom.new('CS001')
  describe '#label' do
    it 'returns the classroom label' do
      expect(cr.label).to eql 'CS001'
    end
  end

  describe '#instance' do
    it 'tests the instance of the class' do
      expect(cr).to be_an_instance_of Classroom
    end
  end

  describe '#classroom' do
    it 'adds students to a classroom' do
      st = Student.new(0o01, 18, true, 'student_name')
      cr.add_student(st)
      expect(st.classroom.label).to eq 'CS001'
    end
  end
end
