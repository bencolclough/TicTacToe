  
  module Names
    def ask_name()
        print "Enter Your Name: "
        gets.chomp
    end
  end

  class Player
    # getter
    attr_reader :name, :players, :counter
    @@players = Hash.new

    def initialize(name, counter)
      @name = name
      @counter = counter
      @@players[self.name]=self.counter
      puts "welcome to TicTacToe #{@name}, you are playing #{@counter}'s"
      p @@players
    end

    def self.players
        @@players
    end
    
  end

  class Game
    include Names
    @@board = [0,1,2,3,"X",5,6,7,8]  

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
        Player.players.each do |name, counter| 
            display_board(@@board)
            print "#{name}, choose location between 0 and 8: "
            player_selection = gets.chomp.to_i
                
            if @@board[player_selection] === "X" || @@board[player_selection] === "O"
                print "That space is taken, choose an available location: "
                player_selection = gets.chomp.to_i
                @@board[player_selection] = counter
            else
                @@board[player_selection] = counter
            end
            display_board(@@board)
        end
        
    end
    
   
  end
  Game1 = Game.new
  Game1.introduce_game
  Game1.get_players
  Game1.choose_location 
  
     




