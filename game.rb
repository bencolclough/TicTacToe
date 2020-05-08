  
module Names
  def ask_name()
    print "Enter Your Name: "
    gets.chomp
  end
end

module TicTacToeBoard
    def display_board(board)
        puts "TIC-TAC-TOE"
        puts " #{board[0]} | #{board[1]} | #{board[2]}"
        puts " #{board[3]} | #{board[4]} | #{board[5]}"
        puts " #{board[6]} | #{board[7]} | #{board[8]}"
    end
    def row_one(board)
        [board[0], board[1], board[2]]
    end
    def row_two(board)
        [board[3], board[4], board[5]]
    end
    def row_three(board)
        [board[6], board[7], board[8]]
    end
    def column_one(board)
        [board[0], board[3], board[6]]
    end
    def column_two(board)
        [board[1], board[4], board[7]]
    end
    def column_three(board)
        [board[2], board[5], board[8]]
    end
    def diagonal(board)
        [board[0], board[4], board[8]]
    end
    def rows_columns_diagonal(board)
        [column_one(board), column_two(board), column_three(board), row_one(board), row_two(board),  row_three(board), diagonal(board)]
    end
    def winning_board(board)
        rows_columns_diagonal(board).any? { |i| i == ["O","O","O"] || i == ["X","X","X"] }
    end
    end

  class Player
    # getter
    attr_reader :name, :players, :counter
    @@players = Hash.new

    def initialize(name, counter)
      @name = name
      @counter = counter
      @@players[self.name]=self.counter #creates a hash of all players where key is name and value is X or O
      puts "welcome to TicTacToe #{@name}, you are playing #{@counter}'s"
    end

    def self.players
        @@players 
    end
    
  end

  class Game
    include Names
    include TicTacToeBoard

    @@board = [1,2,3,4,5,6,7,8,9]  

    def introduce_game
        puts ".......WELCOME TO TIC TAC TOE......."
    end

    def get_players
        print "Player 1, "
        Player.new(ask_name(), "X")
        
        print "Player 2, "
        Player.new(ask_name(), "O")

        print display_board(@@board)
    end

    def not_a_free_space(player_selection)
        @@board[player_selection] === "X" || @@board[player_selection] === "O"
    end

    def not_a_valid_space(player_selection)
        player_selection < 0 || player_selection > 9
    end

    def choose_location(name, counter)
        print "#{name} (#{counter}) choose location between 1 and 9: "
            player_selection = (gets.chomp.to_i - 1)    
            if not_a_free_space(player_selection)
                print "That space is taken dumbass! choose an available location: "
                player_selection = (gets.chomp.to_i - 1)
            elsif not_a_valid_space(player_selection)
                print "That space is not on the board dumbass! choose an available location: "
                player_selection = (gets.chomp.to_i - 1)
            end
            @@board[player_selection] = counter
    end

    def play_game
        empty_locations = 9
            until empty_locations == 0
                break if winning_board(@@board)
                Player.players.each do |name, counter| 
                    break if winning_board(@@board) || empty_locations == 0
                    choose_location(name, counter)
                    empty_locations -= 1
                    display_board(@@board)
                    declare_if_winner(@@board, name)
                    declare_if_draw(empty_locations)
                end
            end
    end

    def declare_if_winner(board, name)
        if winning_board(board)
            puts "#{name} wins!!!"
            puts "Well done #{name}, you nailed it"
        end
    end
    
    def declare_if_draw(empty_locations)
        if empty_locations == 0
            puts "Game over"
            puts "There are no winners here"
        end
    end
  end
  
  Game1 = Game.new
  Game1.introduce_game
  Game1.get_players
  Game1.play_game
  
     




