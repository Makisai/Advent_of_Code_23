class Puzzle
    attr_accessor :calibration

    def initialize
        @calibration = IO.readlines("calibration_document.txt")
        p @calibration.map { |c| value(c) }.sum
    end

    def value(coordinate_string)
        first = coordinate_string.match /[0-9]/
        last = coordinate_string.reverse.match /[0-9]/
        "#{first}#{last}".to_i
    end
end

puzzle = Puzzle.new