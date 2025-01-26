require_relative "TicTacToe"

print "Enter Player 1's Name: "
player_1_name = gets.strip
print "Enter Player 2's Name: "
player_2_name = gets.strip


player_1 = TicTacToe::Player.new(player_1_name, "X") 
player_2 = TicTacToe::Player.new(player_2_name, "O")

game = TicTacToe::Game.new(player_1, player_2)
game.play_game