require_relative './../../app/models/game'

describe Game do
  let(:alex) { double(:player, choice: 'Rock') }
  let(:computer) { double(:player, choice: 'Scissors') }

  describe '#winner' do
    it 'player 1 wins' do
      expect(subject.winner(alex, computer)).to eq alex
    end

    it 'player 2 wins' do
      allow(computer).to receive(:choice).and_return('Paper')
      expect(subject.winner(alex, computer)).to eq computer
    end

    it 'is a draw' do
      allow(computer).to receive(:choice).and_return('Rock')
      expect(subject.winner(alex, computer)).to eq 'draw'
    end
  end
end
