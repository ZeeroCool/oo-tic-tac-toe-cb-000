class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  
  end
############ All possible wining combos ############
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
############ Display current board  ############
  def display_board
  puts " #{@board[0] } | #{@board[1] } | #{@board[2] } \n-----------\n #{@board[3] } | #{@board[4] } | #{@board[5] } \n-----------\n #{@board[6] } | #{@board[7] } | #{@board[8] } "
  end
############ Convert user input to index ############
  def input_to_index(input)
   input.to_i - 1
  end
############ Insert players token to board array position ############
  def move(index, char)
    @board[index] = char
  end
############ Check players chosen position is occupied ############
  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end
############ Check players chosen position is a valid position on board ############
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else false
    end
  end
############ keeps track of which players turn it is ############
  def turn_count
    counter = 0
    @board.each do |turn|
      if turn != " "
        counter += 1
      end
    end
    return counter
  end
############ Identifes the curretn players turn ############
  def current_player
      if turn_count.even? == true
        return "X"
      else
        return "O"
      end
    end
############ Gets user input and executes one turn############
    def turn
        char = current_player
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
    if valid_move?(index) === false
      puts "Try again, Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      end

        move(index, char)
        display_board
    end
    ########## Check if a winning combo exists ##########
    def won?
      win = ""
      #get winning combos
      WIN_COMBINATIONS.each do |win_combo|
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]
        #get board values
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
        #IS THERE A WIINER?
        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return win_combo
        else
          win = false
        end
      end
      if win == false
        return win
      end
    end
    ########## FULL? METHOD - Is the board full? ##########
    def full?
    full = ""
    @board.each do |board_space|
      if board_space == " "
        return false
      else
        full = true
      end
    end
    if full == true
      return true
    end
    end
    ########## DRAW? METHOD - Is it a draw? ##########
    def draw?
    if won? == false && full? == true
      return true
    else
      return false
    end
    end
    ########## OVER? METHOD - Is the game over? ##########
    def over?
    if draw? == true
      return true
    elsif won? != false
      return true
    elsif draw? == true
      return true
    else
    return false
    end
    end

    ########## WINNER? METHOD - Name the winner ##########
    def winner
      if won? == false
        return nil
      end
        #get winning combos
        WIN_COMBINATIONS.each do |win_combo|
          win_index_1 = win_combo[0]
          win_index_2 = win_combo[1]
          win_index_3 = win_combo[2]
          #get board values
          position_1 = @board[win_index_1]
          position_2 = @board[win_index_2]
          position_3 = @board[win_index_3]
          #WHO IS THE WIINER?
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return "X"
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return "O"
          end
        end
      end
    ########## Define your play method below   ##########
       def play
         until over? do
           turn
       end
       if winner == "X"
         puts "Congratulations X!"
       elsif winner == "O"
         puts "Congratulations O!"
       elsif draw? == true
         puts "Cat's Game!"
       end
       end

end
