require_relative '../person'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'
require 'yaml'

describe 'Testing the decorator classes' do
  before :each do
    @person = Person.new(1, 25, 'maximilianus')
  end

  it 'should return maximilianus' do
    @person.correct_name.should eql 'maximilianus'
  end

  it 'should return Maximilianus' do
    cap_name = CapitalizeDecorator.new(@person)
    cap_name.correct_name.should eql 'Maximilianus'
  end

  it 'should return maximilianus' do
    trimmed_name = TrimmerDecorator.new(@person)
    trimmed_name.correct_name.should eql 'maximilian'
  end
end
