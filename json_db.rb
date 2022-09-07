require 'json'

def save_books(books)
  JSON.dump(books, File.open('./database/books.json', 'w'))
end

def save_people(people)
  JSON.dump(people, File.open('./database/people.json', 'w'))
end

def save_rentals(rentals)
  JSON.dump(rentals, File.open('./database/rentals.json', 'w'))
end

def load_books(books)
  json_string = JSON.parse(File.read('./database/books.json'))
  json_string.each do |book|
    books << Book.new(book['title'], book['author'])
  end
rescue StandardError
  puts 'no books was saved'
end

def load_people(people)
  json_string = JSON.parse(File.read('./database/people.json'))
  json_string.each do |person|
    if person['class'] == 'Student'
      people << Student.new(person['age'], nil, name: person['name'],
                                                parent_permission: person['parent_permission'], id: person['id'])
    else
      people << Teacher.new(person['age'], person['specialization'], name: person['name'], id: person['id'])
    end
  end
rescue StandardError
  puts 'no person was saved'
end

def load_rentals(rentals, books, people)
  json_string = JSON.parse(File.read('./database/rentals.json'))
  json_string.each do |rental|
    book = books.find { |b| b.title == rental['book']['title'] }
    person = people.find { |p| p.id == rental['person']['id'] }
    rentals << person.add_rental(rental['date'], book)
  end
rescue StandardError
  puts 'no rentals was saved'
end

def save_state(app)
  save_books(app.books)
  save_people(app.people)
  save_rentals(app.rentals)
end

def load_state(app)
  load_books(app.books)
  load_people(app.people)
  load_rentals(app.rentals, app.books, app.people)
end
