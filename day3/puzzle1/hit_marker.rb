class HitMarker
    attr_accessor :symbol, :adjacent_parts
    def initialize(x, y, symbol)
        @x = x
        @y = y
        @symbol = symbol
        @adjacent_parts = []
    end

    def x_hit_range
        @x-1..@x+1
    end

    def y_hit_range
        @y-1..@y+1
    end

    def add_adjacent_part(adjacent_part)
        @adjacent_parts << adjacent_part
    end

    def to_s
        "HM #{x_hit_range}, #{y_hit_range}" 
    end
end