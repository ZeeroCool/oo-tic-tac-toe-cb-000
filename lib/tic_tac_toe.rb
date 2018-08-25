class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Top Left diagonal
  [2,4,6]  # Top Right diagonal
  ]

  def display_board
  puts " #{@board[0] } | #{@board[1] } | #{@board[2] } \n-----------\n #{@board[3] } | #{@board[4] } | #{@board[5] } \n-----------\n #{@board[6] } | #{@board[7] } | #{@board[8] } "
  end

  def input_to_index(input)
   input.to_i - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else false
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
      if turn_count.even? == true
        return "X"
      else
        return "O"
      end
    end










end
