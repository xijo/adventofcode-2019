# {
#   2: { 0: -, 1: - }
#   1:
#   0:
# }


class Grid
  def initialize(default = nil)
    @mem = Hash.new({})
    @default = default
  end

  def [](x, y)
    @mem[y][x] ||= @default.dup
  end
  alias_method :get, :[]

  def []=(x, y, value)
    row = @mem[y].dup
    row[x] = value
    @mem[y] = row
  end
  alias_method :set, :[]=

  # Find all position pairs with the given value
  def positions(value)
    result = []
    @mem.each do |y, row|
      row.each do |x, col|
        result << [x, y] if get(x, y) == value
      end
    end
    result
  end

  def inspect
    max_y = [@mem.keys.max, 0].compact.max + 2
    min_y = [@mem.keys.min, 0].compact.min - 1
    max_x = [@mem.values.map { |col| col.keys.max }.max, 0].compact.max + 2
    min_x = [@mem.values.map { |col| col.keys.min }.min, 0].compact.min - 1
    max_length = [@mem.values.map { |col| col.values.map { |v| v.inspect.length }.max }.max, 1].compact.max
    axis = 8

    table = (min_y...max_y).to_a.map do |y|
      row = (min_x...max_x).to_a.map do |x|
        get(x, y).to_s.rjust(max_length)
      end.join(' ')
      "#{y.to_s.rjust(axis)} #{row}"
    end.reverse.join(?\n)
    table + "\n".ljust(axis + 2) + (min_x...max_x).map { |i| i.to_s.rjust(max_length) }.join(' ') + "\n"
  end

  def draw_path(path, &block)
    path.points.each do |(x, y)|
      set(x, y, yield(get(x, y)))
    end
  end

  def draw(from, to, reverse: false, &block)
    x_range = Range.new(*[from.first, to.first].sort)
    y_range = Range.new(*[from.last, to.last].sort)
    x_range.each do |x|
      y_range.each do |y|
        set(x, y, yield(get(x, y)))
      end
    end
  end
end
