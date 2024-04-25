class Cubegame
    def initialize(game_input)
        new_round!
        @game_input = game_input
        @overshot = false
    end

    def rounds
        @game_input.split(";")
    end

    def new_round!
        @red = 12
        @green = 13
        @blue = 14
    end

    def play_game!
        rounds.each do |round_input|
            break if @overshot
            new_round!
            round_input.split(",").each do |color|
                color_split = color.strip.split(" ")
                sub_color(color_split.first.to_i, color_split.last)
                @overshot = @red.negative? || @green.negative? || @blue.negative?
            end
        end
    end

    def sub_color(value, color)
        case color
        when "red"
            @red -= value
        when "green"
            @green -= value
        when "blue"
            @blue -= value
        end
    end

    def possible?
        !@overshot
    end

    def to_s
        "red:#{@red}, green:#{@green}, blue:#{@blue}, #{possible?}"
    end
end

val = IO.readlines("game_data.txt").inject(0) do |sum, game_line|
    game_split = game_line.split(":")
    game = Cubegame.new(game_split.last)
    game.play_game!
    puts "#{game} #{game_split.first.split(" ").last.to_i} #{sum}"
    next sum + game_split.first.split(" ").last.to_i if game.possible?
    sum
end

puts "*" * 20
puts val