  
  module Names
    def ask_name()
        print "Enter Your Name: "
        gets.chomp
    end
  end

  class Player
    def initialize(name, counter)
      @name = name
      @counter = counter
      puts "welcome to TicTacToe #{@name}, you are playing #{@counter}'s"
    end
  end

  class Game
    include Names
    @@board = [0,1,2,3,4,5,6,7,8]  

    def introduce_game
        puts ".......WELCOME......."
        display_board(@@board)
    end

    def get_players
        print "Player 1, "
        Player.new(ask_name(), "X")
        
        print "Player 2, "
        Player.new(ask_name(), "O")

    end

    def display_board(board)
        puts "TIC-TAC-TOE"
        puts " #{board[0]} | #{board[1]} | #{board[2]}"
        puts " #{board[3]} | #{board[4]} | #{board[5]}"
        puts " #{board[6]} | #{board[7]} | #{board[8]}"
        
    end

    def choose_location
        display_board(@@board)
        print "Choose location between 0 and 8: "
        player_selection = gets.chomp.to_i
        @@board[player_selection] = "X"
        display_board(@@board)
    end
    
   
  end
  Game1 = Game.new
  Game1.introduce_game
  Game1.get_players
  Game1.choose_location 
  
     




