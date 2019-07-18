require 'rspec'
require_relative 'dog'
require 'pry'

# describe Dog do
RSpec.describe Dog do
  subject { Dog.new }

  describe '#bark' do
    it 'it returns "Woof!"' do
    expect(subject.bark).to eql('Woof!')
    end
  end

  describe '#hungry?' do
    context 'hunger_level > 5' do
      it 'returns true' do
        # dog = Dog.new(hunger_level: 7)
        dog = described_class.new(hunger_level: 7)
        # expect(dog.hungry?).to eql(true)
        expect(dog).to be_hungry
      end
    end

    context 'hunger_level <= 5' do
      it 'returns false' do
        # dog = Dog.new(hunger_level: 5)
        dog = described_class.new(hunger_level: 5)
        # expect(dog.hungry?).to eql(false)
        expect(dog).to_not be_hungry
      end
    end
  end

  describe '#burns calories?' do
    context 'just took a run on the beach' do
      it 'hunger_level increases by 4' do
        # dog = Dog.new(hunger_level: 0)
        # dog = described_class.new(hunger_level: 0)
        binding.pry
        subject { described_class.new(hunger_level: 0) }
        # dog.run_on_beach
        subject.run_on_beach
        # expect(dog.hunger_level).to eql(4)
        expect(subject.hunger_level).to eql(4)
        # expect(dog.hungry?).to be(false)
        # expect(dog).to_not be_hungry
        expect(subject).to_not be_hungry
      end
    end

    context 'just took a walk in the park' do
      it 'hunger_level increases by 2' do
        # dog = Dog.new(hunger_level: 0)
        dog = described_class.new(hunger_level: 4)
        dog.walk_in_the_park
        expect(dog.hunger_level).to eql(6)
        # expect(dog.hungry?).to be(false)
        expect(dog).to be_hungry
      end
    end
  end
end
