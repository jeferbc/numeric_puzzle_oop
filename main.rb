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
    array[index - 8], array[index] = array[index], array[index -8]
    View.print_square(array)
  end

  def self.left(array)
    index = array.index(" ")
    array[index - 1], array[index] = array[index], array[index - 1]
    View.print_square(array)
  end

  def self.up(array)
    index = array.index(" ")
    array[index - 3], array[index] = array[index], array[index - 3]
    View.print_square(array)
  end

  def self.down(array)
    index = array.index(" ")
    array[index - 6], array[index] = array[index], array[index - 6]
    View.print_square(array)
  end
  
end
class View
  def self.print_square(array)
    puts"""
    _ _ _ _ _ _ _ _ _ _ _
    |      |       |      |
    |  #{array[0]}   |  #{array[1]}    |  #{array[2]}   |
    |_ _ _ |_ _ _ _| _ _ _|
    |      |       |      |
    |  #{array[3]}   |  #{array[4]}    |  #{array[5]}   |
    |_ _ _ |_ _ _ _| _ _ _|
    |      |       |      |
    |  #{array[6]}   |  #{array[7]}    |  #{array[8]}   |
    |_ _ _ |_ _ _ _| _ _ _|
    """
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
move = ""
while (move != "\e")
  move = read_char
  case move
    when "\e[A"
      puts "UP ARROW"
      Movement.up(array)
    when "\e[B"
      puts "DOWN ARROW"
      Movement.down(array)
    when "\e[C"
      puts "RIGHT ARROW"
      Movement.right(array)
    when "\e[D"
      puts "LEFT ARROW"
      Movement.left(array)
    when "\e"
      puts "ESCAPE"
      break
  end
  if array == [1, 2, 3, 4, 5, 6, 7, 8," "]
    puts "Felicitaciones"
  end
end
