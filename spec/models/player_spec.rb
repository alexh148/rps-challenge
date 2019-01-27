require_relative './../../app/models/player'

describe Player do
  subject { described_class.new('Al') }
  let(:computer) { described_class.make_computer }

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
    it 'creates a Player object with the name: Computer' do
      expect(computer.name).to eq 'Computer'
    end
  end

  describe '#random_choose' do
    it 'randomly selects R, P or S, and sets this as the choice' do
      computer.random_choose
      expect(computer.choice).to eq 'Rock'
    end
  end
end
