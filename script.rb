# rubocop:disable all
class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def print_info
    puts "Your name is #{name} and your $symbol is #{symbol}"
  end
end

print 'Player 1: Enter your name: '
$name1 = gets.chomp
print 'Player 1: Enter your $symbol "X" or "O": '
$symbol1 = gets.chomp

player1 = Player.new($name1, $symbol1)
player1.print_info

print 'Player 2: Enter your name: '
$name2 = gets.chomp
if $symbol1 == 'X'
  $symbol2 = 'O'
else
  $symbol2 = 'X'
end

player2 = Player.new($name2, $symbol2)
player2.print_info

$matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
$spots_left = 9

def did_win ()
  if $matrix[0][0] == $matrix[0][1] && $matrix[0][0] == $matrix[0][2]
    puts "Won row 1"
  elsif $matrix[1][0] == $matrix[1][1] && $matrix[1][0] == $matrix[1][2]
    puts "Won row 2"
  elsif $matrix[2][0] == $matrix[2][1] && $matrix[2][0] == $matrix[2][2]
    puts "Won row 3"
  elsif $matrix[0][0] == $matrix[1][0] && $matrix[0][0] == $matrix[2][0]
    puts "Won col 1"
  elsif $matrix[0][1] == $matrix[1][1] && $matrix[0][1] == $matrix[2][1]
    puts "Won col 2"
  elsif $matrix[0][2] == $matrix[1][2] && $matrix[0][2] == $matrix[2][2]
    puts "Won col 3"
  elsif $matrix[0][0] == $matrix[1][1] && $matrix[0][0] == $matrix[2][2]
    puts "Won dia 1"
  elsif $matrix[0][2] == $matrix[1][1] && $matrix[0][2] == $matrix[2][0]
    puts "Won dia 2"
  else
    puts "Lose"
  end
end

def play ()
  while $spots_left > 0 do
    if ($spots_left.odd?)
      $matrix.each { |r| puts r.inspect }
      print "#{$name1} Enter the position you want to play: "
      play_position = gets.chomp
      row = $matrix.detect{|aa| aa.include?(play_position.to_i)}
      if (row.index(play_position.to_i))
        $matrix[$matrix.index(row)][row.index(play_position.to_i)] = $symbol1
        $spots_left -= 1
        did_win()
        play()
      end
    else
      $matrix.each { |r| puts r.inspect }
      print "#{$name2} Enter the position you want to play: "
      play_position = gets.chomp
      row = $matrix.detect{|aa| aa.include?(play_position.to_i)}
      if (row.index(play_position.to_i))
        $matrix[$matrix.index(row)][row.index(play_position.to_i)] = $symbol2
        $spots_left -= 1
        did_win()
        play()
      end
    end
  end
end

play()

if ($spots_left == 0)
  $matrix.each { |r| puts r.inspect }
end







