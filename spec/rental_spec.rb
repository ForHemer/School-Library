require_relative 'spec_helper'

describe Rental do
  before :all do
    person = Person.new(30)
    book = Book.new('Title', 'Author')
    @rental = Rental.new('2020/05/03', person, book)
  end

  context '#new' do
    it 'creates a Rental obj' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  context ':date' do
    it 'should return "2020/05/03"' do
      expect(@rental.date).to eql '2020/05/03'
    end
  end

  context ':book' do
    it 'should return a book obj' do
      expect(@rental.book).to be_an_instance_of Book
    end
  end

  context ':person' do
    it 'should return a person obj' do
      expect(@rental.person).to be_an_instance_of Person
    end
  end
end
