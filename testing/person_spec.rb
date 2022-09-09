require_relative '../person'
require_relative '../book'

describe Person do
  before :each do
    @person = Person.new(0o01, 22, 'Arthur')
  end

  describe 'name_of_peson' do
    it 'should be the same name' do
      expect(@person.name).to eql 'Arthur'
    end
  end

  describe 'age_of_person' do
    it 'should be the same age' do
      expect(@person.age).to eql 22
    end
  end

  describe 'can use services' do
    it 'it should return true' do
      @person1 = Person.new(0o01, 25, 'Arthur')
      expect(@person1.can_use_services?).to be true
    end
  end

  describe 'can use services' do
    it 'it should return false' do
      @person2 = Person.new(0o01, 12, 'Arthur', parent_permission: false)
      expect(@person2.can_use_services?).to be false
    end
  end

  describe 'add rental to a person' do
    it 'returns total length' do
      @person.add_rentals('2022/03/05', Book.new('Ruby', 'Kamwadkkd'))
      expect(@person.rentals.length).to eql 1
    end
  end
end
