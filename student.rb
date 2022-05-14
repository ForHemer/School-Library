require_relative 'person'

class Student < Person
  # Define constructor
  def initialize(age, name: 'Unknown', parent_permission: true)
    # Call attributes from parent
    super(age, name: name, parent_permission: parent_permission)
    @classroom = nil
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  # Define getter and setter for @classroom
  attr_accessor :classroom

  # Define Play_hooky method
  def play_hooky
    "¯\(ツ)/¯"
  end
end
