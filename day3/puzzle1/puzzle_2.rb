require_relative "matrix_resolver.rb"

class Puzzle
    def initialize
        matrix_resolver = MatrixResolver.new(debug: false)
        p matrix_resolver.result_p2
    end
end

Puzzle.new