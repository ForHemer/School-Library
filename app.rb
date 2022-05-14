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