class Cell
  attr_accessor :age
  attr_reader :grid, :x, :y

  def initialize(grid, x, y, age = 0)
    @age = age
    @grid = grid
    @x = x
    @y = y
  end

  def dead?
    !@alive
  end

  def alive?
    !@age.zero?
  end

  def kill!
    @age = 0
  end

  def senior?
    @age == 3
  end

  def age!
    if senior?
      kill!
      return
    end
    @age += 1
  end

  def died_off?
    case @age
    when 1
      live_neighbors.length >= 5 || live_neighbors.length <= 1
    when 2
      live_neighbors.length.zero? || live_neighbors.length >= 3
    when 3
      true
    else
      true
    end
  end

  def neighbors
    neighbors = []
    neighbors.push(@world.cell_at(x - 1, y - 1))
    neighbors.push(@world.cell_at(x - 1, y))
    neighbors.push(@world.cell_at(x - 1, y + 1))
    neighbors.push(@world.cell_at(x, y - 1))
    neighbors.push(@world.cell_at(x, y + 1))
    neighbors.push(@world.cell_at(x + 1, y - 1))
    neighbors.push(@world.cell_at(x + 1, y))
    neighbors.push(@world.cell_at(x + 1, y + 1))

    neighbors.compact
  end

  def live_neighbors
    neighbors.select { |n| n && n.alive? }
  end

  def living_neighbors_by_age
    grouped_neighbors_counts = {
      young: 0,
      adult: 0,
      elder: 0
    }
    live_neighbors.each do |n|
      return if n.dead?

      case @age
      when 1
        grouped_neighbors_counts.young += 1
      when 2
        grouped_neighbors_counts.adult += 1
      when 3
        grouped_neighbors_counts.elder += 1
      end
    end
    grouped_neighbors_counts
  end
end
