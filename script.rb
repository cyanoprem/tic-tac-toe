class Player

  attr_accessor :name, :symbol
  
  def initialize (name, symbol)
    @name = name
    @symbol = symbol
  end

  # @@play_position = 0

  # def play
  #   puts 'Enter which position you want to play'
  # end

  # def set_symbol (symbol)
  #   puts 'Enter your symbol "X" or "O"'
  #   @@symbol = symbol
  # end

  def print_info
    puts "Your name is #{self.name} and your symbol is #{self.symbol}" 
  end
end


def get_info
  print 'Enter your name: '
  name = gets.chomp
  print 'Enter your symbol "X" or "O": '
  symbol = gets.chomp
  player = Player.new(name, symbol)
  player.print_info
end

get_info()

