require_relative '../rental'
require 'yaml'

describe Rental do
  before :each do
    @rental = Rental.new('20/20/2020', 'Harry Potter By J.K. Rowling', 1)
  end

  it "rental\'s date should be 20/20/2020" do
    @rental.date.should eql '20/20/2020'
  end

  it "rental\'s book should be Harry Potter By J.K. Rowling" do
    @rental.book.should eql 'Harry Potter By J.K. Rowling'
  end

  it "the rentee\'s id should be 1" do
    @rental.person.should eq 1
  end
end
