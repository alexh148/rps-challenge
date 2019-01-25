class Game
  attr_reader :player_1, :player_2
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def winner
    return player_1 if player_1.choice == 'Rock' && player_2.choice == 'Scissors'
    return player_1 if player_1.choice == 'Scissors' && player_2.choice == 'Paper'
    return player_1 if player_1.choice == 'Paper' && player_2.choice == 'Rock'
    return 'draw' if player_1.choice == player_2.choice
    player_2
  end
end
