class Path
  attr_accessor :points, :position, :start

  def initialize(moves, start: [0, 0])
    @start    = start
    @points   = [start]
    @position = start.dup

    moves.split(?,).each do |move|
      length = move[/\d+/].to_i
      x, y   = @position

      case move[0]
      when ?R
        (x+1..(x+length)).each { |x| @points << [x, y] }
      when ?U
        (y+1..(y+length)).each { |y| @points << [x, y] }
      when ?L
        (x-length..(x-1)).to_a.reverse.each { |x| @points << [x, y] }
      when ?D
        (y-length..(y-1)).to_a.reverse.each { |y| @points << [x, y] }
      end

      @position = @points.last
    end
  end
end
