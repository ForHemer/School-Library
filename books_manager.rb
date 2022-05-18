require_relative 'filemanager'
require_relative 'book'

class BooksManager < FileManager
  def initialize
    super('data/books.json')
  end

  def extract_books(books)
    new_data = []
    books.each do |book|
      new_data << { title: book.title, author: book.author }
    end
    save(new_data)
  end

  def create_books
    books = []
    @data.each do |book|
      books << Book.new(book['title'], book['author'])
    end
    books
  end
end
