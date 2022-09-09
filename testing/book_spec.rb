require_relative '../book'
require_relative '../person'
describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
  end

  describe '#title' do
    it 'should be the same title' do
      expect(@book.title).to eql 'Title'
    end
  end

  describe '#author' do
    it 'should be the same title' do
      expect(@book.author).to eql 'Author'
    end
  end

  describe '#add_rental' do
    it 'adds rental to a book and the person given' do
      @book.add_rental('2022/02/02', Person.new(18, 'student_name'))
      @book.add_rental('2022/02/02', Person.new(18, 'student_name'))
      expect(@book.rentals.length).to eq 2
    end
  end
end
