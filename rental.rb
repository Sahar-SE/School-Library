class Rental
  attr_accessor :date
  attr_accessor :book
  attr_accessor :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @rentee = person
  end
end
