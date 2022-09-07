require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, parent_permission: true, name: 'Unknown', id: SecureRandom.hex(5))
    super(age, parent_permission: parent_permission, name: name, id: id)
    @specialization = specialization
  end

  def to_json(*_args)
    {
      class: self.class,
      id: id,
      age: age,
      name: name,
      parent_permission: parent_permission,
      specialization: specialization
    }.to_json
  end

  def can_use_services?
    true
  end
end
