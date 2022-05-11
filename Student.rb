require "./Person.rb"

class Student < Person
    #Define constructor
    def initialize(classroom)
        #Call attributes from parent
        super(age, name = "Unknown", parent_permission = true)
        @classroom = classroom
    end

    #Define getter and setter for @classroom
    attr_accessor :classroom

    #Define Play_hooky method
    def play_hooky
        return ("¯\(ツ)/¯")
    end
end