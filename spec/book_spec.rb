require_relative 'spec_helper'

describe Book do
  # test if book book obj exist
  before :each do
    @book = Book.new('Title', 'Author')
  end

  context '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end

    it 'instance variable Title should be "Title"' do
      expect(@book.title).to eql 'Title'
    end

    it 'instance variable Author should be "Author"' do
      expect(@book.author).to eql 'Author'
    end
  end

  context '#add_rental' do
    it 'rental is a Rental obj' do
      student = Student.new(5, name: 'Lucas')
      rental = @book.add_rental('2020/05/03', student)
      expect(rental).to be_an_instance_of Rental
    end
  end
end
