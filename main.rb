require_relative 'rover'
require_relative 'direction'

def compile_ops(instructions) 
    optimised_instructions = []

    rotate_clockwise_offset = 0
    forward_offset = 0

    instructions.each_char do |instruction|
        case instruction
        when "L"
            unless forward_offset == 0
                optimised_instructions.push({
                    type: :forward,
                    offset: forward_offset
                })
                forward_offset = 0
            end
            rotate_clockwise_offset -= 1
        when "R"
            unless forward_offset == 0
                optimised_instructions.push({
                    type: :forward,
                    offset: forward_offset
                })
                forward_offset = 0
            end
            rotate_clockwise_offset += 1
        when "F"
            unless rotate_clockwise_offset == 0
                optimised_instructions.push({
                    type: :rotate,
                    offset: rotate_clockwise_offset
                })
                rotate_clockwise_offset = 0
            end
            forward_offset += 1
        end
    end

    if rotate_clockwise_offset != 0
        optimised_instructions.push({
            type: :rotate,
            offset: rotate_clockwise_offset
        })
    elsif forward_offset != 0
        optimised_instructions.push({
            type: :forward,
            offset: forward_offset
        })
    end

    optimised_instructions
end

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

    compile_ops(matched[4]).each do |instruction|
        case instruction[:type]
        when :rotate
            rover.rotate_clockwise(instruction[:offset])
        when :forward
            rover.forward(instruction[:offset])
        end
    end

    puts "(#{rover.coordinate[:x]}, #{rover.coordinate[:y]}, #{rover.direction})#{" LOST" if rover.lost?}"
end