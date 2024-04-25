class Cubegame
    def initialize(game_input)
        new_round!
        @game_input = game_input
    end

    def rounds
        @game_input.split(";")
    end

    def new_round!
        @red = 0
        @green = 0
        @blue = 0
    end

    def play_game!
        rounds.each do |round_input|
            round_input.split(",").each do |color|
                color_split = color.strip.split(" ")
                update(color_split.first.to_i, color_split.last)
            end
        end
    end

    def update(value, color)
        case color
        when "red"
            @red = value if value > @red
        when "green"
            @green = value if value > @green
        when "blue"
            @blue = value if value > @blue
        end
    end

    def power
        @red * @green * @blue
    end
end

val = IO.readlines("game_data.txt").inject(0) do |sum, game_line|
    game_split = game_line.split(":")
    game = Cubegame.new(game_split.last)
    game.play_game!
    sum + game.power
end

puts "*" * 20
puts val