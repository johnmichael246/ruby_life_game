require_relative './grid'

class Game
  def initialize(state, series_length)
    @grid = Grid.new(state)
    @series_length = series_length
  end

  def run
    i = 1
    while i >= @series_length
      puts "generation #{i}"
      puts @grid.state
      @grid.generate_next_gen
      i += 1
    end
  end
end
