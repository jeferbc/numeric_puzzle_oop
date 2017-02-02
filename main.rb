require 'io/console'

class Game
  def self.generate_puzzle
    array = (1..8).to_a
    array << " "
    array.shuffle
  end
end
class Movement
  def self.right(array)
    index = array.index(" ")
    puts index
    if index == 8
      puts array.inspect
      array[0], array[8] = array[8], array[0]
      puts array.inspect
    else
      puts array.inspect
      array[index + 1], array[index] = array[index], array[index + 1]
      puts array.inspect
    end
  end
  def self.left(array)
    index = array.index(" ")
    puts index
    puts array.inspect
    array[index - 1], array[index] = array[index], array[index - 1]
    puts array.inspect
    # if index == 0
    #   puts array.inspect
    #   array[8], array[0] = array[0], array[8]
    #   puts array.inspect
    # else
    #   puts array.inspect
    #   array[index - 1], array[index] = array[index], array[index - 1]
    #   puts array.inspect
    # end
  end
end

# Reads keypresses from the user including 2 and 3 escape character sequences.
def read_char
  STDIN.echo = false
  STDIN.raw!

  input = STDIN.getc.chr
  if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  STDIN.echo = true
  STDIN.cooked!

  return input
end

array = Game.generate_puzzle
move = read_char
case move
  when "\e[A"
    puts "UP ARROW"
  when "\e[B"
    puts "DOWN ARROW"
  when "\e[C"
    puts "RIGHT ARROW"
    Movement.right(array)
  when "\e[D"
    puts "LEFT ARROW"
    Movement.left([4, " ", 6, 8, 3, 2, 1, 7, 5])
end
