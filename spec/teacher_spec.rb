require_relative 'spec_helper'

describe Teacher do
  # test if Teach obj exist
  before :all do
    @maria = Teacher.new(35, 'Maria', 'Math')
  end

  context '#new' do
    it 'Verify that Maria is an instance of teacher class' do
      expect(@maria).to be_an_instance_of Teacher
    end
  end

  it 'return the correct specialization, name and age' do
    expect(@maria.specialization).to eql('Math')
    expect(@maria.age).to eql(35)
    expect(@maria.name).to eql('Maria')
  end

  it 'return true if age is greater than 18 is true' do
    expect(@maria.can_use_services?).to be(true)
  end
end
