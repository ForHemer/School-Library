require_relative 'spec_helper'

describe Student do
  # test if Student obj exist
  before :all do
    @sella = Student.new(35, name: 'Sella', parent_permission: true)
  end

  context '#new' do
    it 'Verify that Sella is an instance of student class' do
      expect(@sella).to be_an_instance_of Student
    end
  end

  it 'return the correct permission, name and age' do
    expect(@sella.parent_permission).to eql(true)
    expect(@sella.age).to eql(35)
    expect(@sella.name).to eql('Sella')
  end
end