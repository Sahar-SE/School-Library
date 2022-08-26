class Book
  attr_accessor :title, :author

  # rubocop:disable Style/ClassVars
  @@books = []
  # rubocop:enable Style/ClassVars
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@books << self
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
  end
end
