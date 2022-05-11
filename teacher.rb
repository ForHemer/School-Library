require './Person'

class Student < Person
  # Define constructor
  def initialize(specialization)
    # Call attributes from parent
    super(age, name: 'Unknown', parent_permission: true)
    @specialization = specialization
  end

  # Define getter and setter for @specialization
  attr_accessor :specialization

  # Override can_use_services? method
  def can_use_services?
    true
  end
end
