class Game
  attr_reader :player_1, :player_2
  WIN_COMBOS = [['Scissors', 'Paper'], ['Paper', 'Rock'], ['Rock', 'Scissors']]
  LOSE_COMBOS = WIN_COMBOS.map { |winner, loser| [loser, winner] }
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def winner
    return player_1 if WIN_COMBOS.include?(choices)
    return player_2 if LOSE_COMBOS.include?(choices)
    'draw'
  end

  private

  def choices
    [player_1.choice, player_2.choice]
  end
end
