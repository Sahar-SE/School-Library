class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @rentee = person
    person.rentals << self unless person.rentals.include? self
    book.rentals << self unless book.rentals.include? self
    @rentals = person
    book.rentals.push(self)
    @person = person
    person.rentals.push(self)
  end

  def to_json(*_args)
    {
      date: date,
      book: book,
      person: person
    }.to_json
  end
end
