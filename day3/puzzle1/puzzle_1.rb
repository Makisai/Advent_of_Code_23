require_relative "matrix_resolver.rb"

class Puzzle
    def initialize
        matrix_resolver = MatrixResolver.new(debug: false)
    end
end

Puzzle.new