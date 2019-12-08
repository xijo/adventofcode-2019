require 'terminfo'
require 'term/ansicolor'

class String
  include Term::ANSIColor
end

class Printer
  def run(computer, instruction)
    puts "\e[H\e[2J"
    _lines, cols = TermInfo.screen_size        # [lines, columns]

    field_size = 10
    fields_per_row = (cols / field_size).floor
    # puts cols
    # puts fields_per_row
    # raise 'sdf'
    rows = [
      "#{computer.name} executing #{instruction.class.name.black.on_blue}"
    ]

    computer.memory.each_with_index.each_slice(fields_per_row) do |slice|
      rows << slice.map do |(i, index)|
        field = i.to_s.rjust(field_size)
        field = field.black.on_blue if index == computer.ipointer
        field = field.black.on_green if index > computer.ipointer && index < computer.ipointer + instruction.length
        field = field.black.on_red if index == instruction.change_position
        field
      end.join
    end
    puts rows.join("\n")

  end
end
