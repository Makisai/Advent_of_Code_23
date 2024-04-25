require_relative "hit_marker.rb"
require_relative "machine_part.rb"

class MatrixResolver
    def initialize(debug: false)
        puts "start resolver"
        file = debug ? "puzzle_input_test.txt" : "puzzle_input.txt"
        @matrix = IO.readlines(file).map { |line| line.chomp.chars }
        @machine_parts = []
        @hit_markers = []
        find_markers!
        find_machine_parts!
        select_machine_parts
    end

    def result_p1
        p @machine_parts.filter(&:hit).sum(&:value)
    end

    def result_p2
        star_hit_markers = @hit_markers.filter {|hit_marker| hit_marker.symbol == "*" && hit_marker.adjacent_parts.size == 2}
        star_hit_markers.sum {|hit_marker| hit_marker.adjacent_parts.first.value * hit_marker.adjacent_parts.last.value}
    end

    def find_markers!
        @matrix.each_with_index do |row, y|
            row.each_with_index do |cell, x| 
                unless %w[0 1 2 3 4 5 6 7 8 9 .].include?(cell)
                    @hit_markers << HitMarker.new(x,y,cell)
                end
            end
        end
    end

    def select_machine_parts
        @hit_markers.each do |hit_marker|
            @machine_parts.each do |machine_part|
                hit_x = hit_marker.x_hit_range.any? {|x_range| x_range.between?(machine_part.start_x, machine_part.end_x) }
                hit_y = machine_part.y >= hit_marker.y_hit_range.begin && machine_part.y <= hit_marker.y_hit_range.end 
                if hit_x && hit_y
                    machine_part.hit = true
                    hit_marker.add_adjacent_part(machine_part)
                end
            end
        end
    end

    def find_machine_parts!
        @matrix.each_with_index do |row, y|
            row.each_with_index do |cell, x| 
                if %w[0 1 2 3 4 5 6 7 8 9].include?(cell) && @machine_parts.none? {|machine_part| x.between?(machine_part.start_x , machine_part.end_x) && machine_part.y == y}
                    start_x = x
                    value = [cell]
                    while
                        start_x += 1
                        break if start_x >= row.size
                        next_digit = row[start_x]
                        if %w[0 1 2 3 4 5 6 7 8 9].include?(next_digit)
                            value << next_digit
                        else
                            break
                        end
                    end
                    @machine_parts << MachinePart.new(x, x + value.size - 1 , y, value.join.to_i)
                end
            end
        end
    end
end