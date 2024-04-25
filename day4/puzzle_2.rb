class Puzzle2
    def initialize
        @scratchcard_count = 0
        @all_scatchcards = IO.readlines("game_input.txt")
    end

    def resolve_scratchcard(index)
        wins = evaluate_scarchcards(index)
        @scratchcard_count += 1

        return if wins == 0


        #p "#{index}: #{((index+1)..(index + 1 + wins))} gewinne: #{wins}"
        next_scratchcard = index + 1
        (next_scratchcard..(index + wins)).each { |i| resolve_scratchcard(i) }
    end

    def evaluate_scarchcards(index)
        #puts index
        winning_numbers = @all_scatchcards[index].split(":").last.split("|").first.strip.split(" ")
        elfs_numbers = @all_scatchcards[index].split(":").last.split("|").last.strip.split(" ")
        points = 0
        winning_numbers.each do |winning_number|
            if elfs_numbers.include?(winning_number)
                points += 1
            end
        end
        points
    end

    def solve_puzzle
        @all_scatchcards.each_index do |index| 
            p index
            resolve_scratchcard(index)
        end
        @scratchcard_count
    end
end

p "Ergebnis: #{Puzzle2.new.solve_puzzle}"