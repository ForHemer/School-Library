class Person
    #Define constructor
    def initialize(name ="Unknown", age, parent_permission = true)
        @id = Random.rand(1..1_000_000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end    
    #Define getters and setters for @name and @age
    attr_accessor :name
    attr_accessor :age
    #Define getter @id
    attr_reader :id

    #Define private method
    private
    def is_of_age?
        if (@age >= 18)
            return true
        else
            return false
    end

    def can_use_services?
        is_of_age? || @parent_permission = true
    end
end
