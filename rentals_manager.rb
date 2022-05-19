require_relative 'filemanager'
require_relative 'rental'

class RentalsManager < FileManager
  def initialize
    super('data/rentals.json')
  end

  def save_rental(rental)
    puts rental.person.id
    @data << { person_id: rental.person.id, book_title: rental.book.title, book_author: rental.book.author,
               date: rental.date }
    save
  end

  def fetch_rentals(books, patron)
    rentals = []
    @data.each do |rental|
      person = patron.find { |p| p.id == rental['person_id'] }
      book = books.find { |b| b.title == rental['book_title'] && b.author == rental['book_author'] }

      rentals << Rental.new(rental['date'], person, book) if person && book
    end
    rentals
  end
end
