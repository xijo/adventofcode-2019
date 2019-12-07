require_relative 'intcode/computer'
require_relative 'intcode/parameter'
require_relative 'intcode/instruction'

Dir.glob('intcode/instructions/*.rb').each { |f| require_relative f }
