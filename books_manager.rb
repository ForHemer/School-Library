require_relative 'filemanager'
require_relative 'book'

class BooksManager < FileManager
  def initialize
    super('data/books.json')
  end

  def save_book(book)
    @data << { title: book.title, author: book.author }
    save
  end

  def fetch_books
    books = []
    @data.each do |book|
      books << Book.new(book['title'], book['author'])
    end
    books
  end
end
