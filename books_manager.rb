require_relative 'filemanager'

class BooksManager < FileManager
  def initialize
    super('data/books.json')
  end
end