require_relative 'decorator'
require_relative 'rental'

class Person < Nameable
  # Define constructor
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1_000_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Define getters and setters for @name and @age
  attr_accessor :name, :age, :rentals
  # Define getter @id
  attr_reader :id

  # Define correct_name method
  def correct_name
    @name
  end

  # Define private method
  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission = true
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
