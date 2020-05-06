class Player
  def initialize(name, counter)
    @name = name
    @counter = counter
    puts "welcome to tictactoe #{@name}, you are playing #{@counter}'s"
  end
  
end

def get_players()
    puts "Player 1, Enter Your Name"
    name = gets.chomp
    Player.new(name, "X")
    puts "Player 2, Enter Your Name"
    name = gets.chomp
    Player.new(name, "O")
end

get_players()
