require './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(*_args)
    {
      title: title,
      author: author
    }.to_json
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
