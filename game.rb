  
  board = [[1,2,3],[4,5,6],[7,8,9]]  
  
  def display_board(board)
    puts "TIC-TAC-TOE"
    p board[0]
    p board[1]
    p board[2]
  end
  display_board(board)
  
  class Player
    def initialize(name, counter)
      @name = name
      @counter = counter
      puts "welcome to TicTacToe #{@name}, you are playing #{@counter}'s"
    end
  end

  def ask_name()
    print "Enter Your Name: "
    gets.chomp
  end

  def get_players()
    print "Player 1, "
    Player.new(ask_name(), "X")
    print "Player 2, "
    Player.new(ask_name(), "O")
  end

get_players




