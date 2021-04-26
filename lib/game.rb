require_relative './grid'

class Game
  def initialize(state, series_length)
    @grid = Grid.new(state)
    @series_length = series_length
  end

  def run
    i = 1
    while i <= @series_length
      puts "generation #{i}"
      p @grid.display_current_gen
      @grid.generate_next_gen
      i += 1
    end
    puts 'ending generation: '
    p @grid.display_current_gen
  end
end
