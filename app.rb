require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

# Define list of otions 
def list_options
  puts 'Welcome to School library App!'
  puts "
    Please choose an option by entering a number:
    1- List all books
    2- List all patron
    3- Create a person
    4- Create a book
    5- Create a rental
    6- List all rentals for a given person id
    7- Exit"
end

# Define options
def options(books, patron, rentals)
  loop do
    list_options
    option = gets.chomp.to_i
    case option
    when 1
      books_list(books)
    when 2
      patrons_list(patron)
    when 3
      create_person(patron)
    when 4
      create_book(books)
    when 5
      create_rental(books, rentals, patron)
    when 6
      rental_list_by_id(rentals)
    else
      break
    end
  end
end

# Define create_person method
def create_person(patron)
  print 'Do you want to create a student (1) or a teacher (2): '
  choice = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  case choice
  when 1
    print 'Has parent permission? [Y/N]: '
    input = gets.chomp
    case input.upcase
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end
    patron.push(Student.new(age, name: name, parent_permission: permission))
  when 2
    print 'Specialization: '
    specialization = gets.chomp
    patron.push(Teacher.new(specialization, age, name))
  end
  puts 'Person created successfully.'
end