class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author

  def add_rental(rental)
    @rentals << rental
  end
end
