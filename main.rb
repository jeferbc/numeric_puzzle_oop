class Game
  def self.generate_puzzle
    array = (1..8).to_a
    array << " "
    array.shuffle
  end
end

puts Game.generate_puzzle
