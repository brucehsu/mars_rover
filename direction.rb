class Direction
    attr_reader :facing

    NORTH = 0
    EAST = 1
    SOUTH = 2
    WEST = 3
    def initialize(facing)
        @facing = facing
    end

    def rotate_left(offset = 1)
        @facing -= offset
        @facing += 4 if @facing < 0
        self
    end

    def rotate_right(offset = 1)
        @facing = (@facing + offset) % 4
        self
    end

    def rotate_clockwise(offset)
        actual_offset_abs = offset.abs % 4
        if offset > 0
            self.rotate_right(actual_offset_abs)
        elsif offset < 0
            self.rotate_left(actual_offset_abs)
        end
    end

    def to_s
        case @facing
        when Direction::NORTH
            "N"
        when Direction::EAST
            "E"
        when Direction::SOUTH
            "S"
        when Direction::WEST
            "W"
        end
    end
end