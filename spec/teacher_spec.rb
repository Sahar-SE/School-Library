require_relative '../teacher'
require_relative '../person'
require 'yaml'

describe Teacher do
  before :each do
    @teacher = Teacher.new(1, 30, 'Math', 'Jack')
  end

  it 'teacher should be an instance of Person' do
    @teacher.should be_a Person
  end

  it "teacher\'s id should be 1" do
    @teacher.id.should eq 1 
  end

  it "teacher\'s age should be 30" do
    @teacher.age.should eq 30
  end

  it "teacher\'s specialization should be Math" do
    @teacher.specialization.should eql 'Math' 
  end

  it "teacher\'s name should be Jack" do
    @teacher.name.should eql 'Jack' 
  end

  it "can_use_services? should return true" do
    @teacher.can_use_services?.should eq true 
  end
end