require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'
require_relative 'books_manager'
require_relative 'student_manager'
require_relative 'teacher_manager'

class App
  def initialize
    @books = BooksManager.new.fetch_books
    @patron = link_people
    @rentals = []
  end

  def display_welcome
    puts 'Welcome to School library App!'
  end

  def list_options
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

  def options
    loop do
      list_options
      option = gets.chomp.to_i
      case option
      when 1
        books_list(@books)
      when 2
        patrons_list(@patron)
      when 3
        create_person(@patron)
      when 4
        create_book(@books)
      when 5
        create_rental(@books, @rentals, @patron)
      when 6
        rental_list_by_id(@rentals)
      else
        break
      end
    end
  end

  # Join teachers and students in one patron
  def link_people
    result = []
    result.push(*StudentManager.new.fetch_students)
    result.push(*TeacherManager.new.fetch_teachers)
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
      create_student(patron, age, name)
    when 2
      create_teacher(patron, age, name)
    end
    puts 'Person created successfully.'
  end

  # Create Student
  def create_student(patron, age, name)
    print 'Has parent permission? [Y/N]: '
    input = gets.chomp
    case input.upcase
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end
    student = Student.new(age, name: name, parent_permission: permission)
    patron.push(student)
    StudentManager.new.save_student(student)
  end

  # Create Teacher
  def create_teacher(patron, age, name)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    patron.push(teacher)
    TeacherManager.new.save_teacher(teacher)
  end

  # Define create_rental method
  def create_rental(books, rentals, patron)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_input = gets.chomp.to_i

    puts 'Select a person from the following list by number (Not ID): '
    patron.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_input = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rentals.push(Rental.new(date, patron[person_input], books[book_input]))
    puts 'Rental created successfully.'
  end

  # Define create_book method
  def create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books.push(book)
    BooksManager.new.save_book(book)
    puts 'Book created successfully.'
  end

  # Define patrons_list method
  def patrons_list(patrons)
    patrons.each { |patron| puts "[#{patron.class}] Name: #{patron.name}, ID: #{patron.id}, Age: #{patron.age}" }
  end

  # Define rental_list_by_id method
  def rental_list_by_id(rentals)
    print 'ID of person: '
    person_id = gets.chomp.to_i
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end

  # Define books_list method
  def books_list(books)
    books.each { |book| puts "Title '#{book.title}', Author #{book.author}" }
  end
end
