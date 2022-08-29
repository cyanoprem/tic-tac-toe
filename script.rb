# rubocop:disable all
# Class for creating Players
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def print_info
    puts "Your name is #{name} and your symbol is #{symbol}"
  end
end

def game_start
  puts 'Play Tic-Tac-Toe - 2 Players'
  print 'Player 1: Enter your name: '
  $name1 = gets.chomp
  get_symbol
  player1 = Player.new($name1, $symbol1)
  player1.print_info

  print 'Player 2: Enter your name: '
  $name2 = gets.chomp
  player2 = Player.new($name2, $symbol2)
  player2.print_info

  $matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  $spots_left = 9
end

def get_symbol
  print 'Player 1: Enter your symbol "X" or "O": '
  $symbol1 = gets.chomp
  if $symbol1.upcase == 'X'
    $symbol1 = 'X'
    $symbol2 = 'O'
  elsif $symbol1.upcase == 'O'
    $symbol1 = 'O'
    $symbol2 = 'X'
  else
    puts 'Invalid symbol :('
    get_symbol
  end
end

def get_input
  if $spots_left.odd?
    $matrix.each { |r| puts r.inspect }
    print "#{$name1} Enter the position you want to play: "
    play_position = gets.chomp
    valid_input(play_position, $symbol1)
  else
    $matrix.each { |r| puts r.inspect }
    print "#{$name2} Enter the position you want to play: "
    play_position = gets.chomp
    valid_input(play_position, $symbol2)
  end
end

def valid_input(play_position, symbol)
  begin
    play_position = Integer(play_position)
    play(play_position, symbol)
  rescue ArgumentError, TypeError
    puts 'Invalid input :('
  end
end

def play(play_position, symbol)
  row = $matrix.detect { |aa| aa.include?(play_position.to_i) }
  if row == nil
    puts 'Invalid input :('
    get_input
  elsif row.index(play_position.to_i)
    $matrix[$matrix.index(row)][row.index(play_position.to_i)] = symbol
    $spots_left -= 1
    did_win
  end
end

def did_win()
  if $matrix[0][0] == $matrix[0][1] && $matrix[0][0] == $matrix[0][2]
    who_won($matrix[0][0])
  elsif $matrix[1][0] == $matrix[1][1] && $matrix[1][0] == $matrix[1][2]
    who_won($matrix[1][0])
  elsif $matrix[2][0] == $matrix[2][1] && $matrix[2][0] == $matrix[2][2]
    who_won($matrix[2][0])
  elsif $matrix[0][0] == $matrix[1][0] && $matrix[0][0] == $matrix[2][0]
    who_won($matrix[0][0])
  elsif $matrix[0][1] == $matrix[1][1] && $matrix[0][1] == $matrix[2][1]
    who_won($matrix[0][1])
  elsif $matrix[0][2] == $matrix[1][2] && $matrix[0][2] == $matrix[2][2]
    who_won($matrix[0][2])
  elsif $matrix[0][0] == $matrix[1][1] && $matrix[0][0] == $matrix[2][2]
    who_won($matrix[0][0])
  elsif $matrix[0][2] == $matrix[1][1] && $matrix[0][2] == $matrix[2][0]
    who_won($matrix[0][2])
  else
    if $spots_left == 0
      puts 'Draw!!'
      game_start
    else
      get_input
    end
  end
end

def who_won(symbol)
  if symbol == $symbol1
    $matrix.each { |r| puts r.inspect }
    puts "#{$name1}! You have Won!"
    $spots_left = 0
    game_start
  elsif symbol == $symbol2
    $matrix.each { |r| puts r.inspect }
    puts "#{$name2}! You have Won!"
    $spots_left = 0
    game_start
  end
end

# Starts the game
game_start

get_input while $spots_left > 0
