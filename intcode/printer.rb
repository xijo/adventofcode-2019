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
      "#{computer.name} executing #{instruction.class.name.white.on_blue}, ipointer: #{computer.ipointer}, relative base: #{computer.relative_base}"
    ]

    computer.memory.each_with_index.each_slice(fields_per_row) do |slice|
      rows << slice.map do |(i, index)|
        field = i.to_s.rjust(field_size)
        field = field.white.on_blue if index == computer.ipointer
        field = field.black.on_green if index > computer.ipointer && index < computer.ipointer + instruction.length
        field = field.black.on_bright_red if index == instruction.change_position

        Array(instruction.read_position).each do |rp|
          field = field.black.on_bright_green if index == rp
        end

        field
      end.join
    end
    puts rows.join("\n")

  end
end
