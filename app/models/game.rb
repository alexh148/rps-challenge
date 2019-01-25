class Game
  def winner(player_1, player_2)
    return player_1 if player_1.choice == 'Rock' && player_2.choice == 'Scissors'
    return player_1 if player_1.choice == 'Scissors' && player_2.choice == 'Paper'
    return player_1 if player_1.choice == 'Paper' && player_2.choice == 'Rock'
    return 'draw' if player_1.choice == player_2.choice
    player_2
  end
end
