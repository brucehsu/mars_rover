require_relative 'direction'

class MarsRover
    def initialize(x, y, facing, grid_m, grid_n)
        @direction = Direction.new(facing)
        @x = x
        @y = y
        @lost = false
        @grid_m = grid_m
        @grid_n = grid_n
        @last_known_coordinate = self.coordinate
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

    def lost?
        @lost = true if @x > @grid_m or @x < 0 or @y > @grid_n or @y < 0
        @lost
    end

    def coordinate
        unless self.lost?
            @last_known_coordinate = {
                x: @x,
                y: @y
            }
        end
        @last_known_coordinate
    end
end