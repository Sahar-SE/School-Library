require_relative '../person'
require 'yaml'

describe Person do
  before :each do
    @person = Person.new(1, 20, 'Jack')
  end

  it "person\'s id should be 1" do
    @person.id.should eq 1
  end

  it "person\'s age should be 20" do
    @person.age.should eq 20
  end

  it "person\'s name should be ack" do
    @person.name.should eql 'Jack'
  end

  it "person\'s parent permission should be true" do
    @person.parent_permission.should eq true
  end

  it 'can_use_services? should return true' do
    @person.can_use_services?.should eq true
  end
end
