class Direction
    attr_reader :facing

    NORTH = 0
    EAST = 1
    SOUTH = 2
    WEST = 3
    def initialize(facing)
        @facing = facing
    end

    def rotate_left
        if @facing - 1 < 0
            @facing = Direction::WEST
        else
            @facing -= 1
        end
        self
    end

    def rotate_right
        if @facing + 1 > Direction::WEST
            @facing = Direction::NORTH
        else
            @facing += 1
        end
        self
    end
end