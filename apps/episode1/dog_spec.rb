require 'rspec'
require_relative 'dog'
require 'pry'

RSpec.describe Dog do
  subject { Dog.new }

  describe '#bark' do
    it 'it returns "Woof!"' do
    expect(subject.bark).to eql('Woof!')
    end
  end

  describe '#hungry?' do
    context 'hunger_level > 5' do
      subject { described_class.new(hunger_level: 7) }
      it 'returns true' do
        expect(subject).to be_hungry
      end
    end

    context 'hunger_level <= 5' do
      subject { described_class.new(hunger_level: 5) }
      it 'returns false' do
        expect(subject).to_not be_hungry
      end
    end
  end

  describe '#burns calories?' do
    context 'just took a run on the beach' do
      subject { described_class.new(hunger_level: 0) }
      it 'hunger_level increases by 4' do
        subject.run_on_beach
        expect(subject.hunger_level).to eql(4)
        expect(subject).to_not be_hungry
      end
    end

    context 'just took a walk in the park' do
      subject { described_class.new(hunger_level: 4) }
      it 'hunger_level increases by 2' do
        subject.walk_in_the_park
        expect(subject.hunger_level).to eql(6)
        expect(subject).to be_hungry
      end
    end
  end

  describe '#feed' do
    context 'when the dog is hungry' do
      subject { described_class.new(hunger_level: 448) }
      it 'sets hunger_level to 0' do
        subject.feed
        expect(subject).to_not be_hungry
      end
    end
  end
end
