require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  before :each do
    @book = Book.new('Java', 'Paul')
    @person = Person.new(11, 326, 'Kiddy')
    @rental = Rental.new('2022/02/02', @book, @person)
  end

  describe 'test its instance' do
    it 'returns the same class' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns the same date' do
      expect(@rental.date).to eql '2022/02/02'
    end
  end

  describe '#name_person' do
    it 'returns the same name of person' do
      expect(@rental.person.name).to eql 'Kiddy'
    end
  end

  describe '#author_of_book' do
    it 'returns the same name of author' do
      expect(@rental.book.author).to eql 'Paul'
    end
  end
end
