module TicTacToe 

  LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  
  class Player
    def initialize(name, marker) 
      @marker = marker
      @name = name
    end
    attr_reader :marker, :name

    def select_position!
      print "Select your #{marker} position (1-9): "
      selection = gets.to_i
      return selection
    end
  end

  class Game 
    def initialize(player_1, player_2) 
      @board = Array.new(10, "-")

      @current_player_id = 0
      @players = [player_1, player_2]
    end
    attr_reader :board, :current_player_id

    def play_game
      loop do
        # current player makes a move 
        place_marker(current_player)

        # game checks if there is a victory 
        if player_won?(current_player)
          puts "#{current_player.name} wins!"
          print_board
          return 
        # check if the board is full 
        elsif board_full? 
          puts "It's a draw!"
          print_board
          return
        end
        # if no victory or draw then switch player turns 
        switch_players!
        # and finally print the board after the move 
        print_board
      end
    end

    def place_marker(player) 

      loop do 
        position = player.select_position!

        if valid_position(position) 
          puts "#{player.name} chooses position #{position}"
          @board[position] = player.marker
          break
        else 
          puts "Not a valid position, enter another!"
        end
      end
    end

    def valid_position(position) 
      if @board[position] == "-"
        return true 
      else 
        return false
      end

    end

    def player_won?(player)
      LINES.any? do |line|
        line.all? { |position| @board[position] == player.marker}
      end
    end

    def board_full?
      @board.none? { |element| element == "-"}
    end

    def other_player_id
      1 - @current_player_id
    end

    def current_player
      @players[@current_player_id]
    end

    def other_player
      @players[other_player_id]
    end

    def switch_players!
      @current_player_id = other_player_id
    end

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