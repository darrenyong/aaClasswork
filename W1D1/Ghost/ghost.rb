class Game
  attr_accessor :fragment, :players, :losses

  def initialize(players)
    @players = players
    @fragment = ""
    @dictionary = ["cat"]
    @ghost = "GHOST"
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
  end

  def run
    @losses = Hash.new(0)
    @players.each do |ele|
      @losses[ele.name] = 0
    end
    
    until @players.length == 1
      play_round
      until game_lost?
        play_round
      end

      losing_player = @losses.sort_by {|k, v| v}.last.first
      puts "#{losing_player} is eliminated!"
      @players.delete_if { |ele| ele.name == losing_player }
      @losses.delete_if { |k,v| v == 5 }
    end

    puts "#{@players[0].name} is the winner!"
  end

  def game_lost?
    @losses.values.any?(5)
  end

  def display_standings
    @players.each do |ele|
      idx = @losses[ele.name]
      puts "#{ele.name}: #{@ghost[0...idx]}"
    end
  end

  def play_round
    display_standings
    @fragment = ""
    current_player
    take_turn(current_player)
    
    until round_lost?
      next_player!
      take_turn(current_player)
    end

    puts "#{current_player.name} lost!"
    @losses[current_player.name] += 1
    puts "#{current_player.name} now has #{@ghost[0...(@losses[current_player.name])]}."
    next_player!
  end

  def round_lost?
    @dictionary.include?(@fragment)
  end

  def take_turn(player)
    guess = player.guess
    
    until valid_play?(guess)
      player.alert_invalid_guess
      guess = player.guess
    end
    
    @fragment += guess
  end

  def valid_play?(guess)
    if !('a'..'z').to_a.include?(guess)
      return false
    end 

    new_frag = @fragment + guess
    @dictionary.any? do |word|
      word[0..new_frag.length - 1] == new_frag 
    end
  end

end


class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "Guess a letter"
    gets.chomp
  end

  def alert_invalid_guess
    puts "Not a letter! Guess again:"
  end
end


player1 = Player.new("Darren")
player2 = Player.new("Andy")
player3 = Player.new("Brent")
player4 = Player.new("Catherine")
players = [player1, player2, player3, player4]

game = Game.new(players)