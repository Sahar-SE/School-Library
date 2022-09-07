require './person'
require 'json'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name: 'Unknown', id: SecureRandom.hex(5))
    super(age, name: name, id: id)
    @specialization = specialization
  end

  def to_json(*_args)
    {
      class: self.class,
      id: id,
      age: age,
      name: name,
      specialization: specialization
    }.to_json
  end

  def can_use_services?
    true
  end
end
