class MachinePart
    attr_accessor :hit, :start_x, :end_x, :y, :value
    def initialize(start_x, end_x, y, value)
        @start_x = start_x
        @end_x = end_x
        @y = y
        @value = value
        @hit = false
    end

    def to_s
        "MP start: #{@start_x}, end: #{@end_x}, y: #{@y}, value: #{@value}"
    end
end