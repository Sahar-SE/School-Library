class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @rentee = person
    person.rentals << self unless person.rentals.include? self
    book.rentals << self unless book.rentals.include? self
  end
end
