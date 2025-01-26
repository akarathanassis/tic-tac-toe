require_relative "TicTacToe"

player_1 = TicTacToe::Player.new("X") 
player_2 = TicTacToe::Player.new("O")

game = TicTacToe::Game.new(player_1, player_2)
game.play_game