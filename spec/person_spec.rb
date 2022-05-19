require_relative 'spec_helper'

describe Person do
  # test if book book obj exist
  before :all do
    @maria = Person.new(5, name: 'Maria', parent_permission: false)
    @jonas = Person.new(30, name: 'Jonas', id: 3505)
    @unknown = Person.new(10)
  end

  context '#new' do
    it 'returns a Person object' do
      expect(@maria).to be_an_instance_of Person
      expect(@jonas).to be_an_instance_of Person
      expect(@unknown).to be_an_instance_of Person
    end
  end

  context '#correct_name' do
    it 'maria should return "Maria"' do
      expect(@maria.correct_name).to eql 'Maria'
    end

    it 'unknown should return "Unknown"' do
      expect(@unknown.correct_name).to eql 'Unknown'
    end
  end

  context '#can_use_services?' do
    it 'maria cannot use service' do
      expect(@maria.can_use_services?).to be false
    end

    it 'jonas can use service' do
      expect(@jonas.can_use_services?).to be true
    end
  end

  context '#add_rental' do
    it 'rental is a Rental obj' do
      book = Book.new('Title', 'Author')
      expect(@maria.add_rental('2020/05/03', book)).to be_an_instance_of Rental
    end
  end
end
