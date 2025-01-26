module TicTacToe 
  
  class Player
    def initialize(marker) 
      @marker = marker
    end
    attr_reader :marker

    def select_position
      print "Select your #{marker} position (1-9): "
      selection = gets.to_i
      return selection
    end
  end

  class Game 
    def initialize(player_1, player_2) 
      @board = Array.new(10, "-")
    end
    attr_reader :board

    def print_board
      puts "
       #{@board[1]} | #{@board[2]} | #{@board[3]}
      ---+---+---
       #{@board[4]} | #{@board[5]} | #{@board[6]}
      ---+---+---
       #{@board[7]} | #{@board[8]} | #{@board[9]}
      "
    end
  end


end