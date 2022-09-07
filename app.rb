require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'students'

class App
  attr_accessor :books, :people, :rentals
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def user_input(text)
    print text
    gets.chomp
  end

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
      input = user_input('Choose an option: ').to_i

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

  def list_books
    puts '-' * 50
    if @books.empty?
      puts 'The books list is empty'
    else
      puts 'Books list:'
      @books.each_with_index do |book, index|
        puts "#{index}-[Book] Title: #{book.title} | Author: #{book.author}"
      end
    end
  end

  def list_people
    puts '-' * 50
    if @people.empty?
      puts "The people\'s list is empty"
    else
      puts 'People list:'
      @people.each_with_index do |person, index|
        if person.is_a?(Teacher)
          puts " #{index}-{Teacher} ID: #{person.id}
          | Name: #{person.name} | Age: #{person.age} | Specialization #{person.specialization}"
        end
        if person.is_a?(Student)
          puts "  #{index}-[Student] ID: #{person.id}
          | Name: #{person.name} | Age: #{person.age} | Classroom #{person.classroom}"
        end
      end
    end
  end

  def create_person
    puts '-' * 50
    option = user_input('Do you want to create a student (1) or a teacher (2)? [input the number]: ').to_i
    name = user_input('Name: ')
    age = user_input('Age: ')
    case option
    when 1
      create_student(name, age, nil)
    when 2
      create_teacher(name, age)
    else
      puts 'Please input a valid number'
    end
  end

  def create_student(name, age, classroom)
    parent_permission = user_input("Has parent\'s persmission? [Y/N]: ")
    parent_permission = true if parent_permission == ('y' || 'Y')
    parent_permission = false if parent_permission == ('n' || 'N')
    @people << Student.new(age, classroom, parent_permission: parent_permission, name: name)
    puts "Student (#{name}) has been created successfully"
  end

  def create_teacher(name, age)
    specialization = user_input("Teacher\'s specialization: ")
    @people << Teacher.new(age, specialization, name: name)
    puts "Teacher (#{name}) has been created successfully"
  end

  def create_book
    title = user_input("Book\'s title: ")
    author = user_input("Book\'s author: ")
    @books << Book.new(title, author)
    puts "Book (#{title} By #{author}) has been created successfully"
  end

  def create_rental
    if @books.empty?
      puts 'Books list is empty, please create a book first'
    elsif @people.empty?
      puts 'People list is empty, please create a person first'
    else
      list_books
      book_number = user_input('Select a book from the following list by number: ').to_i
      list_people
      person_number = user_input('Select a person from the following list by number: ').to_i
      date = user_input('Date: ')
      @rentals << Rental.new(date, @books[book_number], @people[person_number])
    end
  end

  def list_rentals
    list_people
    input_id = user_input("Person\'s ID: ").to_i
    selected_person = @people.select { |person| person.id == input_id }
    selected_person[0].rentals.each do |rental|
      puts "Date: #{rental.date} | Book: #{rental.book.title} By #{rental.book.author}"
    end
  end
end
