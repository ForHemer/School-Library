require_relative 'rental'

class Book
  # Define constructor
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Define getter and setter
  attr_accessor :title, :author

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
