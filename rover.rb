require_relative 'direction'

class MarsRover
    def initialize(x, y, facing)
        @direction = Direction.new(facing)
        @x = x
        @y = y
    end

    def rotate_left
        @direction.rotate_left
    end

    def rotate_right
        @direction.rotate_right
    end

    def forward
        case @direction.facing
        when Direction::NORTH
            @y += 1
        when Direction::SOUTH
            @y -= 1
        when Direction::EAST
            @x += 1
        when Direction::WEST
            @x -= 1
        end
    end

    def coordinate
        {
            x: @x,
            y: @y
        }
    end
end