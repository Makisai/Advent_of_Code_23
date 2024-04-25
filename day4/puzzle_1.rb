
all_points = IO.readlines("game_input.txt").map do |scratch_card| 
    winning_numbers = scratch_card.split(":").last.split("|").first.strip.split(" ")
    elfs_numbers = scratch_card.split(":").last.split("|").last.strip.split(" ")
    points = 0
    winning_numbers.each do |winning_number|
        if elfs_numbers.include?(winning_number)
            if points == 0
                points = 1
            else
                points *= 2
            end
        end
    end
    points
end
p all_points.sum
