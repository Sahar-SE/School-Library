class Book
  attr_accessor :title, :author
  @@books = []
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@books << self
  end

  def add_rental(person, date)
    rental = Rental.new(date,self,person)
  end
end
