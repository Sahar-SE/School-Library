required_relative 'nameable'
class BaseDecorator
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        nameable.correct_name
    end
end