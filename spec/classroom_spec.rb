require_relative '../classroom'
require 'yaml'

describe Classroom do
  before :each do
    @classroom = Classroom.new('English')
  end

  it 'classroom label should be English' do
    @classroom.label.should eql 'English'
  end
end
