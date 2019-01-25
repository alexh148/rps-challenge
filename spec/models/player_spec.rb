require_relative './../../app/models/player'

describe Player do
  subject { described_class.new('Al') }

  describe '#defaults' do
    it 'has a name' do
      expect(subject.name).to eq 'Al'
    end
  end

  describe '#choice' do
    it 'chooses the players choice' do
      subject.choose('Paper')
      expect(subject.choice).to eq 'Paper'
    end
  end

  describe '#make_computer' do
    let(:computer) { described_class.make_computer }
    it 'creates a Player object with the name: Computer' do
      expect(computer.name).to eq 'Computer'
    end

    it 'creates a Player object with a random RPS choice' do
      expect(computer.choice).to eq 'Rock'
    end
  end
end
