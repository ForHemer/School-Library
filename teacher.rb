require_relative 'person'

class Teacher < Person
  # Define constructor
  def initialize(age, name, specialization, id: nil)
    # Call attributes from parent
    super(age, name: name, id: id)
    @specialization = specialization
  end

  # Define getter and setter for @specialization
  attr_accessor :specialization

  # Override can_use_services? method
  def can_use_services?
    true
  end
end
