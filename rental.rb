class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @rentee = person
  end
end
