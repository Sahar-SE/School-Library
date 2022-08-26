require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'student'

class App
  def run
    puts 'Welcome to School Library App!'
    loop do
      puts '-' * 50
      puts '
          1- List all books
          2- List all people
          3- Create a new person
          4- Create a new book entry
          5- Create a new rental entry
          6- List all rentals for a given person id
          7- Quit'
      puts 'Choose an option: '
      input = gets.chomp.to_i

      break if input == 7

      operation(input)
    end
  end

  def operation(input)
    case input
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    else
      puts 'Please choose a valid option number'
    end
  end

  def create_student
    puts "Student\'s name : "
    name = gets.chomp
    puts "Student\'s age: "
    age = gets.chomp
    puts "Student\'s classroom: "
    classroom = gets.chomp
    puts "Has parent\'s persmission? [Y/N]: "
    parent_permission = gets.chomp
    parent_permission = true if parent_permission == ('y' || 'Y')
    parent_permission = false if parent_permission == ('n' || 'N')
    Student.new(age, classroom, name, parent_permission)
    puts "Student (#{name}) has been created successfully"
  end

  def create_teacher
    puts "Teacher\'s name : "
    name = gets.chomp
    puts "Teacher\'s age: "
    age = gets.chomp
    puts "Teacher\'s specialization: "
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
    puts "Teacher (#{name}) has been created successfully"
  end

  def create_book
    puts "Book\'s title: "
    title = gets.chomp
    puts "Book\'s author: "
    author = gets.chomp
    Book.new(title, author)
    puts "Book (#{title} By #{author}) has been created successfully"
  end

  def create_rental
    books = Book.class_variable_get(:@@books)
    people = Person.class_variable_get(:@@people)
    if books.empty?
      puts 'Books list is empty, please create a book first'
    elsif people.empty?
      puts 'People list is empty, please create a person first'
    else
      puts 'Select a book from the following list by number'
      list_books
      book_number = gets.chomp.to_i
      puts 'Select a person from the following list by number'
      list_people
      person_number = gets.chomp.to_i
      puts 'Date: '
      date = gets.chomp
      Rental.new(date, books[book_number], people[person_number])
    end
  end

  def list_rentals
    people = Person.class_variable_get(:@@people)
    puts "Person\'s ID: "
    input_id = gets.chomp.to_i
    selected_person = people.select { |person| person.id = input_id }
    selected_person[0].rentals.each do |rental|
      puts "Date: #{rental.date} | Book: #{rental.book.title} By #{rental.book.author}"
    end
  end
end
