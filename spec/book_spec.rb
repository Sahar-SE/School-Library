require_relative '../book'
require 'yaml'

describe Book do
  before :each do
    @book = Book.new('title', 'author')
  end

  it "should print the book\'s title" do
    @book.title.should eql 'title'
  end

  it "should print the book\'s author" do
    @book.author.should eql 'author'
  end
end
