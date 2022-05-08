require_relative 'rover'
require_relative 'direction'

m, n = gets.split(/ /).map { |str| str.to_i }
while line = gets
    matched = /\((\d+), (\d+), ([NESW])\) ([LFR]+)/.match(line)
    raise RuntimeError.new('Invalid input') if matched.nil?

    direction = case matched[3]
    when "N"
        Direction::NORTH
    when "E"
        Direction::EAST
    when "S"
        Direction::SOUTH
    when "W"
        Direction::WEST
    end
    rover = MarsRover.new(matched[1].to_i, matched[2].to_i, direction, m, n)

    matched[4].each_char do |instruction|
        case instruction
        when "L"
            rover.rotate_left
        when "R"
            rover.rotate_right
        when "F"
            rover.forward
        end
    end

    puts "(#{rover.coordinate[:x]}, #{rover.coordinate[:y]}, #{rover.direction})#{" LOST" if rover.lost?}"
end