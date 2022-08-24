class Person
    # accessing the attributes by attr_accessor method
    attr_accessor :name, :age
    attr_reader :id
    def initialize(age, name = "Unknown", parent_permission = true)
    # instance variables
       @id = Random.rand(1..300)
       @name = name
       @age = age 
       @parent_permission = parent_permission
    end
    def is_of_age?
        age >= 18 ? true : false
    end
    
    private :is_of_age?
    
    def can_use_services?
        age >= 18 or parent_permission ? true : false 
    end

    public :can_use_services?
end



