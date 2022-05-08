require_relative 'direction'

class MarsRover
    attr_reader :direction

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
        @direction.rotate_left unless self.lost?
    end

    def rotate_right
        @direction.rotate_right unless self.lost?
    end

    def rotate_clockwise(offset)
        @direction.rotate_clockwise(offset) unless self.lost?
    end

    def forward
        unless self.lost?
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
    end

    def lost?
        @lost = true if @x > @grid_m or @x < 0 or @y > @grid_n or @y < 0
        unless @lost
            @last_known_coordinate = {
                x: @x,
                y: @y
            }
        end
        @lost
    end

    def coordinate
        self.lost? # trigger update
        @last_known_coordinate
    end
end