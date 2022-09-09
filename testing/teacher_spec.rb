require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(0o1, 25, 'Developer', 'Edube')
  end

  describe 'returns student age' do
    it 'returns the same age' do
      expect(@teacher.age).to eql 25
    end
  end

  describe 'returns student name' do
    it 'returns the same name' do
      expect(@teacher.name).to eql 'Edube'
    end
  end

  describe 'test its instance' do
    it 'returns the same class' do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end
end
