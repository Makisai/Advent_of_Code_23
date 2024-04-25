class Puzzle
    SEARCH = /(?=([1-9]|one|two|three|four|five|six|seven|eight|nine))/

    def initialize
        calibration = IO.readlines("calibration_document.txt")
        p calibration.map { |c| value(c) }.sum
    end

    def value(coordinate_string)
        parse_table = {
            "one" => 1,
            "two" => 2,
            "three" => 3,
            "four" => 4,
            "five" => 5,
            "six" => 6,
            "seven" => 7,
            "eight" => 8,
            "nine" => 9,
        }
        first = coordinate_string.scan(SEARCH).flatten.first
        last = coordinate_string.scan(SEARCH).flatten.last

        first = parse_table[first] if first.size > 1
        last = parse_table[last] if last.size > 1

        p "#{coordinate_string} -> #{coordinate_string.scan(SEARCH)} = #{first}#{last}"
        "#{first}#{last}".to_i
    end
end

puzzle = Puzzle.new