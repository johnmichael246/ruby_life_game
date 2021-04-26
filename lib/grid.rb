require_relative './cell'
class Grid
  attr_reader :state

  def initialize(state)
    values = state.map(&:size)
    raise StandardError 'Size of the grid must be uniform.' if values.uniq.size > 1

    height = state[0].size
    width = (state.transpose)[0].size
    @cells = []
    height.times do |x|
      @cells.push([])
      width.times do |y|
        @cells[x].push(Cell.new(self, x, y, state[y][x]))
      end
    end
  end

  def formatted_cells
    @cells.flatten
  end

  def generate_next_gen
    affected_dead = []
    affected_aged = []
    formatted_cells.each do |cell|
      neighbors = cell.living_neighbors_by_age
      if cell.dead?
        affected_aged.push(cell) if neighbors.adult == 2
      elsif cell.died_off?
        affected_dead.push(cell)
      else
        affected_aged.push(cell)
      end
    end
    affected_aged.each(&:age!)
    affected_dead.each(&:kill!)
  end

  def cell_at(x, y)
    if @cells[x]
        @cells[x][y] 
    end
  end
end
