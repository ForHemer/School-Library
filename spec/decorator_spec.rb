require_relative 'spec_helper'

describe Nameable do
  before :all do
    @nameable = Nameable.new
  end
  context '#new' do
    it 'nameable shoud be an instance of Nameable' do
      expect(@nameable).to be_an_instance_of Nameable
    end
  end

  context '#correct_name' do
    it 'correct name method should throw an error' do
      expect { @nameable.correct_name }.to raise_error('NotImplementedError')
    end
  end
end

describe Decorator do
  before :all do
    maria = Person.new(30, name: 'maria')
    @decorator = Decorator.new(maria)
  end

  context '#new' do
    it 'decorator shoud be an instance of Decorator' do
      expect(@decorator).to be_an_instance_of Decorator
    end
  end

  context '#correct_name' do
    it 'shoud return "Maria"' do
      expect(@decorator.correct_name).to eql 'maria'
    end
  end
end

describe CapitalizeDecorator do
  before :all do
    maria = Person.new(30, name: 'maria')
    @decorator = CapitalizeDecorator.new(maria)
  end

  context '#new' do
    it 'decorator shoud be an instance of CapitalizeDecorator' do
      expect(@decorator).to be_an_instance_of CapitalizeDecorator
    end
  end

  context '#correct_name' do
    it 'shoud return "Maria"' do
      expect(@decorator.correct_name).to eql 'Maria'
    end
  end
end

describe TrimmerDecorator do
  before :all do
    maximilianus = Person.new(30, name: 'maximilianus')
    @decorator = TrimmerDecorator.new(maximilianus)
  end

  context '#new' do
    it 'decorator shoud be an instance of TrimmerDecorator' do
      expect(@decorator).to be_an_instance_of TrimmerDecorator
    end
  end

  context '#correct_name' do
    it 'shoud return "maximilian"' do
      expect(@decorator.correct_name).to eql 'maximilian'
    end
  end
end
