require_relative '../direction'

RSpec.describe Direction do
    it "rotates counter-clockwise through 4 directions" do
      direction = Direction.new(Direction::WEST)
      expect(direction.facing).to eq(Direction::WEST)
      direction.rotate_left
      expect(direction.facing).to eq(Direction::SOUTH)
      direction.rotate_left
      expect(direction.facing).to eq(Direction::EAST)
      direction.rotate_left
      expect(direction.facing).to eq(Direction::NORTH)
      direction.rotate_left
      expect(direction.facing).to eq(Direction::WEST)
    end

    it "rotates clockwise through 4 directions" do
      direction = Direction.new(Direction::NORTH)
      expect(direction.facing).to eq(Direction::NORTH)
      direction.rotate_right
      expect(direction.facing).to eq(Direction::EAST)
      direction.rotate_right
      expect(direction.facing).to eq(Direction::SOUTH)
      direction.rotate_right
      expect(direction.facing).to eq(Direction::WEST)
      direction.rotate_right
      expect(direction.facing).to eq(Direction::NORTH)
    end
  end
  