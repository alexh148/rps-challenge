require_relative './../../app/models/game'

describe Game do
  let(:alex) { double(:player, choice: 'Rock') }
  let(:computer) { double(:player, choice: 'Scissors') }
  let(:game) { described_class.new(alex, computer) }

  describe '#player_1' do
    it 'returns player_1 object' do
      expect(game.player_1).to eq alex
    end
  end

  describe '#player_2' do
    it 'returns player_2 object' do
      expect(game.player_2).to eq computer
    end
  end

  describe '#winner' do
    it 'player 1 wins' do
      expect(game.winner).to eq alex
    end

    it 'player 2 wins' do
      allow(computer).to receive(:choice).and_return('Paper')
      expect(game.winner).to eq computer
    end

    it 'is a draw' do
      allow(computer).to receive(:choice).and_return('Rock')
      expect(game.winner).to eq 'draw'
    end
  end
end
