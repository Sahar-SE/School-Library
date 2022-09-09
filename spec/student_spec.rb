require_relative '../student'
require_relative '../person'
require 'yaml'

describe Student do
  before :each do
    @student = Student.new(1, 20, 'Math', 'Jack', parent_permission: false)
  end

  it 'student should be an instance of Person' do
    @student.should be_a Person
  end

  it "student\'s id should be 1" do
    @student.id.should eq 1
  end

  it "student\'s age should be 20" do
    @student.age.should eq 20
  end

  it "student\'s classroom should be Math" do
    @student.classroom.label.should eql 'Math'
  end

  it "student\'s name should be Jack" do
    @student.name.should eql 'Jack'
  end

  it "student\'s parent permission should be false" do
    @student.parent_permission.should eq false
  end

  it 'can_use_services? should return true' do
    @student.can_use_services?.should eq true
  end
end
